import json
import jsonschema
from datetime import datetime
from dateutil.relativedelta import relativedelta
from robot.api import logger
from robot.api.deco import keyword


@keyword("Verify Json Schema")
def verify_json_schema(schema_folder: str, schema_file: str,
                       schema_type: str, json_payload: object):
    schema_file_path = f"{schema_folder}/{schema_file}.json"

    with open(schema_file_path) as schema_file_output:
        validate_schema_output = json.load(schema_file_output)
    validate_schema = validate_schema_output[schema_type]
    try:
        jsonschema.validate(json_payload, validate_schema)
    except jsonschema.ValidationError as e:
        logger.debug(e)
        debug_info = (
            f"{json_payload}\n"
            f"{'=' * 150}\n"
            f"{e}"
        )
        print(debug_info)
        raise jsonschema.ValidationError(
            'Validation error for schema {}: {}'.format(schema_type, e.message))
