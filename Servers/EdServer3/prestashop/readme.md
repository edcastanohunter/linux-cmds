However, if you want to customize the container execution, here are many available options:

| Environment variable  | Description | Default value |
|---|---|---|
| PS_DEV_MODE | The constant _PS_MODE_DEV_ will be set at true | `0` |
| PS_HOST_MODE | The constant _PS_HOST_MODE_ will be set at true. Useful to simulate a PrestaShop Cloud environment. | `0` |
| PS_DEMO_MODE | The constant _PS_DEMO_MODE_ will be set at true. Use it to create a demonstration shop. | `0` |
| DB_SERVER | If set, the external MySQL database will be used instead of the volatile internal one | `localhost` |
| DB_USER | Override default MySQL user | `root` |
| DB_PASSWD | Override default MySQL password | `admin` |
| DB_PREFIX | Override default tables prefix | `ps_` |
| DB_NAME | Override default database name | `prestashop` |
| PS_INSTALL_AUTO | The installation will be executed. Useful to initialize your image faster. In some configurations, you may need to set PS_DOMAIN or PS_HANDLE_DYNAMIC_DOMAIN as well. (Please note that PrestaShop can be installed automatically from PS 1.5) | `0` |
| PS_ERASE_DB | Drop the mysql database. All previous mysql data will be lost | `0` |
| PS_INSTALL_DB | Create the mysql database. | `0` |
| PS_DOMAIN | When installing automatically your shop, you can tell the shop how it will be reached. For advanced users only | |
| PS_LANGUAGE | Change the default language installed with PrestaShop | `en` |
| PS_COUNTRY | Change the default country installed with PrestaShop | `GB` |
| PS_ALL_LANGUAGES | Install all the existing languages for the current version. | `0` |
| PS_FOLDER_ADMIN | Change the name of the admin folder | `admin` |
| PS_FOLDER_INSTALL | Change the name of the install folder | `install` |
| PS_ENABLE_SSL | Enable SSL at PrestaShop installation. | `0` |
| ADMIN_MAIL | Override default admin email | `demo@prestashop.com` |
| ADMIN_PASSWD | Override default admin password | `prestashop_demo` |

If your IP / port (or domain) change between two executions of your container, you will need to modify this option:

| Environment variable  | Description | Default value |
|---|---|---|
| PS_HANDLE_DYNAMIC_DOMAIN | Add specific configuration to handle dynamic domain | `0` |

Taken from: https://github.com/PrestaShop/docker