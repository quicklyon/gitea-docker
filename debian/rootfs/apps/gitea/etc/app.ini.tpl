APP_NAME = QuickOn platform gitea application.
RUN_USER = git
RUN_MODE = prod

[security]
INSTALL_LOCK = true
SECRET_KEY   = {{GITEA_SECRET_KEY}}
REVERSE_PROXY_LIMIT = 1
REVERSE_PROXY_TRUSTED_PROXIES = *

[database]
DB_TYPE = mysql
HOST    = {{MYSQL_HOST}}
NAME    = {{MYSQL_DB}}
USER    = {{MYSQL_USER}}
PASSWD  = {{MYSQL_PASSWORD}}
SSL_MODE = disable
CHARSET  = utf8
LOG_SQL  = false

[repository]
ROOT = /data/repo
DEFAULT_PRIVATE = private

[repository.local]
LOCAL_COPY_PATH = /data/tmp/local-repo

[repository.upload]
TEMP_PATH = /data/tmp/uploads

[server]
DOMAIN           = {{APP_DOMAIN}}
APP_DATA_PATH    = /data
SSH_DOMAIN       = {{APP_DOMAIN}}
HTTP_PORT        = 3000
ROOT_URL         = {{APP_PROTOCOL}}://{{APP_DOMAIN}}
DISABLE_SSH      = {{DISABLE_SSH}}
SSH_PORT         = 22
SSH_LISTEN_PORT  = 22
START_SSH_SERVER = true
BUILTIN_SSH_SERVER_USER = git
LFS_START_SERVER = true
LFS_JWT_SECRET   = {{GITEA_LFS_JWT_SECRET}}
LANDING_PAGE	 = login
REQUIRE_SIGNIN_VIEW = false
OFFLINE_MODE     = true

[lfs]
STORAGE_TYPE = local
PATH = /data/lfs

[api]
ENABLE_SWAGGER = {{ENABLE_SWAGGER}}

[picture]
AVATAR_UPLOAD_PATH = /data/avatars
REPOSITORY_AVATAR_UPLOAD_PATH = /data/repo-avatars
DISABLE_GRAVATAR        = true
ENABLE_FEDERATED_AVATAR = false

[attachment]
PATH = /data/attachments

[service]
DISABLE_REGISTRATION = true
REQUIRE_SIGNIN_VIEW  = true
DEFAULT_USER_VISIBILITY  = private
DEFAULT_ORG_VISIBILITY   = private

[openid]
ENABLE_OPENID_SIGNIN = false
ENABLE_OPENID_SIGNUP = false

[session]
PROVIDER = file
PROVIDER_CONFIG = /data/sessions

[log]
MODE      = console
LEVEL     = info
ROOT_PATH = /data/log
ROUTER    = console

[other]
SHOW_FOOTER_BRANDING = false
SHOW_FOOTER_VERSION = false
SHOW_FOOTER_TEMPLATE_LOAD_TIME = false
ENABLE_SITEMAP = false
ENABLE_FEED = false

[i18n]
LANGS = zh-CN,en-US,zh-HK,zh-TW
NAMES = 简体中文,English,繁體中文（香港）,繁體中文（台灣）

[migrations]
ALLOW_LOCALNETWORKS    = true

[webhook]
ALLOWED_HOST_LIST = {{ALLOWED_HOST_LIST}}

[actions]
ENABLED = true
