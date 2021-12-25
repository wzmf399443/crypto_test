# Symbol Info
TRADE_SPOT_SYMBOL_INFO_DROPDOWN_TEXT = '//*[@id="app"]//div[contains(@class,"symbol-dropdown")]//div[@class="toggle"]'
TRADE_SPOT_SYMBOL_INFO_ITEM_LAST_PRICE_TEXT = '//*[@id="app"]//div[contains(@class,"last-price")]//div[contains(@class,"item-value")]'
TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_CHANGE = '//*[@id="app"]//div[@class="current-symbol"]/div/div[2]/div[@class="item-title"]'
TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_HIGH = '//*[@id="app"]//div[@class="current-symbol"]/div/div[3]/div[@class="item-title"]'
TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_LOW = '//*[@id="app"]//div[@class="current-symbol"]/div/div[4]/div[@class="item-title"]'
TRADE_SPOT_SYMBOL_INFO_TITLE_TEXT_24H = '//*[@id="app"]//div[@class="current-symbol"]/div/div[5]/div[@class="item-title"]'

# Trade Form
TRADE_SPOT_TRADE_FORM_BUTTON_TAB_BUY = '//*[@id="app"]//div[contains(@class,"trading-form")]//div[@class="button-tabs"]/div[text()=" Buy "]'
TRADE_SPOT_TRADE_FORM_BUTTON_TAB_SELL = '//*[@id="app"]//div[contains(@class,"trading-form")]//div[@class="button-tabs"]/div[text()=" Sell "]'
TRADE_SPOT_TRADE_FORM_ORDER_TYPE_LIMIT = '//*[@id="app"]//div[@class="spot-tabs"]//div[@class="order-type-tabs"]//div[text()="Limit"]'
TRADE_SPOT_TRADE_FORM_ORDER_TYPE_TIP_ICON = '//*[@id="app"]//div[@class="spot-tabs"]//div[@class="order-type-tabs"]//div[@class="advanced-dropdown-trigger"]//*[@class="e-icon e-icon-info"]'
TRADE_SPOT_TRADE_FORM_ORDER_TYPE_DROPDOWN_ICON = '//*[@id="app"]//div[@class="spot-tabs"]//div[@class="order-type-tabs"]//div[@class="advanced-dropdown-trigger"]//*[@class="e-icon e-icon-accordion"]'
TRADE_SPOT_TRADE_FORM_ORDER_TYPE_DROPDOWN_LIST = '//*[@id="app"]//div[@class="spot-tabs"]//div[@class="order-type-tabs"]//div[contains(@class,"e-dropdown-content")]'
TRADE_SPOT_TRADE_FORM_DISPLAY_TRADE_BLOCK = '//*[@id="app"]//div[@class="trade-block" and not(contains(@style,"display: none"))]'
TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_TYPE = f'{TRADE_SPOT_TRADE_FORM_DISPLAY_TRADE_BLOCK}//span[@class="trade-type"]'
TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_TYPE_AMOUNT = f'{TRADE_SPOT_TRADE_FORM_DISPLAY_TRADE_BLOCK}//span[@class="amount"]'
TRADE_SPOT_TRADE_FORM_TRADE_BLOCK_TRADE_INPUT = f'{TRADE_SPOT_TRADE_FORM_DISPLAY_TRADE_BLOCK}//div[@class="trade-input"]/div[@class="input-item"]'

# Order Book
TRADE_SPOT_ORDER_BOOK_TITLE_TEXT = '//*[@id="app"]//div[@class="order-book"]//div[@class="title"]'
TRADE_SPOT_ORDER_BOOK_CURRENT_PRICE = '//*[@id="app"]//div[@class="order-book"]//div[@class="current-price"]/span'
TRADE_SPOT_ORDER_BOOK_ASK_LIST = '//*[@id="app"]//div[@class="order-book"]//div[@class="list-content" and .//div[contains(@class,"color-ask-price")]]'
TRADE_SPOT_ORDER_BOOK_BUY_LIST = '//*[@id="app"]//div[@class="order-book"]//div[@class="list-content" and .//div[contains(@class,"color-buy-price")]]'
TRADE_SPOT_ORDER_BOOK_ASK_LIST_PRICE_TEXT = f'{TRADE_SPOT_ORDER_BOOK_ASK_LIST}//div[@class="price color-ask-price"]'
TRADE_SPOT_ORDER_BOOK_BUY_LIST_PRICE_TEXT = f'{TRADE_SPOT_ORDER_BOOK_BUY_LIST}//div[@class="price color-buy-price"]'
TRADE_SPOT_ORDER_BOOK_DECIMAL_POINT_DROPDOWN = '//*[@id="app"]//div[@class="order-book"]//div[@class="e-dropdown"]'
TRADE_SPOT_ORDER_BOOK_DECIMAL_POINT_DROPDOWN_LIST = '//*[@id="app"]//div[@class="order-book"]//div[@class="e-dropdown"]//ul'

# Popup
TRADE_SPOT_POPUP_MESSAGE_TITLE = '//div[contains(@class,"e-modal")]//div[@class="d-title"]'
TRADE_SPOT_POPUP_MESSAGE_CONTENT = '//div[contains(@class,"e-modal")]//div[@class="d-desc"]'
TRADE_SPOT_POPUP_CANCEL_BUTTON = '//div[contains(@class,"e-modal")]//div//button'
