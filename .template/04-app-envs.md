<!-- 这里写应用的【环境变量信息】 -->
| 变量名           | 默认值        | 说明                             |
| ---------------- | ------------- | -------------------------------- |
| EASYSOFT_DEBUG   | false         | 是否打开调试信息，默认关闭       |
| APP_DOMAIN       | 0.0.0.0:8080  | Gitea域名,影响访问与仓库的地址 |
| APP_PROTOCOL     | https         | Gitea域名协议 |
| MYSQL_HOST       | 127.0.0.1     | MySQL 主机地址                   |
| MYSQL_PORT       | 3306          | MySQL 端口                       |
| MYSQL_DB         | gitea          | spug 数据库名称                 |
| MYSQL_USER       | root          | MySQL 用户名                      |
| MYSQL_PASSWORD   | pass4QuickOn  | MySQL 密码                        |
| DEFAULT_ADMIN_USER| gitea        | 默认管理员名称             |
| DEFAULT_ADMIN_PASSWORD | pass4Gitea | 默认管理员密码 |
| GITEA_ADMIN_EMAIL | admin@demo.com | 管理员邮箱地址|
| ENABLE_SWAGGER   | false         | 是否启动Swagger API页面|
| ALLOWED_HOST_LIST | *         | 信任的 Webhook 域名列表 |
| MAIL_ENABLED | false        | 是否启用邮箱功能 |
| SMTP_HOST | mail.demo.com        | 邮箱地址 |
| SMTP_PORT | 465        | 邮箱端口 |
| SMTP_USER | gitea@demo.com        | 邮箱发送账号 |
| SMTP_PASS | mail4Gitea        | 邮箱发送账号密码 |
| SSH_LISTEN_PORT | 22        | 默认监听22 |
| START_SSH_SERVER | false        | 默认不开启ssh |
| DISABLE_SSH | false        | 默认不禁用ssh |
