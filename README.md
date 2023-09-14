<!-- 该文档是模板生成，手动修改的内容会被覆盖，详情参见：https://github.com/quicklyon/template-toolkit -->
# QuickOn Gitea 应用镜像

[![GitHub Workflow Status](https://github.com/quicklyon/gitea-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/quicklyon/gitea/actions/workflows/docker.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/easysoft/gitea?style=flat-square)
![Docker Image Size](https://img.shields.io/docker/image-size/easysoft/gitea?style=flat-square)
![GitHub tag](https://img.shields.io/github/v/tag/quicklyon/gitea-docker?style=flat-square)

> 申明: 该软件镜像是由QuickOn打包。在发行中提及的各自商标由各自的公司或个人所有，使用它们并不意味着任何从属关系。

## 快速参考

- 通过 [渠成软件百宝箱](https://www.qucheng.com/app-install/install-gitea-134.html) 一键安装 **Gitea**
- [Dockerfile 源码](https://github.com/quicklyon/gitea-docker)
- [Gitea 源码](https://github.com/go-gitea/gitea)
- [Gitea 官网](https://gitea.io/)

## 一、关于 Gitea

<!-- 这里写应用的【介绍信息】 -->
Gitea 是一个自己托管的Git服务程序。他和GitHub, Bitbucket or Gitlab等比较类似。他是从 Gogs 发展而来，不过我们已经Fork并且命名为Gitea。对于我们Fork的原因可以看 [这里](https://blog.gitea.io/2016/12/welcome-to-gitea/)。

![screenshots](https://raw.githubusercontent.com/quicklyon/gitea-docker/main/.template/screenshot.png)

Gitea官网：[https://gitea.io/](https://gitea.io/)

<!-- 这里写应用的【附加信息】 -->
### 目标

Gitea的首要目标是创建一个极易安装，运行非常快速，安装和使用体验良好的自建 Git 服务。我们采用Go作为后端语言，这使我们只要生成一个可执行程序即可。并且他还支持跨平台，支持 Linux, macOS 和 Windows 以及各种架构，除了x86，amd64，还包括 ARM 和 PowerPC。

### 功能特性

- 支持活动时间线
- 支持 SSH 以及 HTTP/HTTPS 协议
- 支持 SMTP、LDAP 和反向代理的用户认证
- 支持反向代理子路径
- 支持用户、组织和仓库管理系统
- 支持添加和删除仓库协作者
- 支持仓库和组织级别 Web 钩子（包括 Slack 集成）
- 支持仓库 Git 钩子和部署密钥
- 支持仓库工单（Issue）、合并请求（Pull Request）以及 Wiki
- 支持迁移和镜像仓库以及它的 Wiki
- 支持在线编辑仓库文件和 Wiki
- 支持自定义源的 Gravatar 和 Federated Avatar
- 支持邮件服务
- 支持后台管理面板
- 支持 MySQL、PostgreSQL、SQLite3、MSSQL 和 TiDB(MySQL) 数据库
- 支持多语言本地化（21 种语言）
- 支持软件包注册中心（Composer/Conan/Container/Generic/Helm/Maven/NPM/Nuget/PyPI/RubyGems）

### 系统要求

- 最低的系统硬件要求为一个廉价的树莓派
- 如果用于团队项目，建议使用 2 核 CPU 及 1GB 内存

### 浏览器支持

Chrome, Firefox, Safari, Edge

## 二、支持的版本(Tag)

由于版本比较多,这里只列出最新的5个版本,更详细的版本列表请参考:[可用版本列表](https://hub.docker.com/r/easysoft/gitea/tags/)

<!-- 这里是应用的【Tag】信息，通过命令维护，详情参考：https://github.com/quicklyon/template-toolkit -->
- [latest,1.20.4,1.20.4-20230914](https://github.com/go-gitea/gitea/releases/tag/v1.20.4)
- [1.20.3,1.20.3-20230725](https://github.com/go-gitea/gitea/releases/tag/v1.20.3)
- [1.20.1,1.20.1-20230725](https://github.com/go-gitea/gitea/releases/tag/v1.20.1)
- [1.19.4,1.19.4-20230706](https://github.com/go-gitea/gitea/releases/tag/v1.19.4)
- [1.19.3-20230505](https://github.com/go-gitea/gitea/releases/tag/v1.19.3)
- [1.19.2-20230428](https://github.com/go-gitea/gitea/releases/tag/v1.19.2)
- [1.19.1-20230418](https://github.com/go-gitea/gitea/releases/tag/v1.19.1)
- [1.19.0-20230411](https://github.com/go-gitea/gitea/releases/tag/v1.19.0)
- [1.18.5-20230313](https://github.com/go-gitea/gitea/releases/tag/v1.18.5)
- [1.18.3-20230208](https://github.com/go-gitea/gitea/releases/tag/v1.18.3)
- [1.17.4-20221223](https://github.com/go-gitea/gitea/releases/tag/v1.17.4)
- [1.17.3-20221017](https://github.com/go-gitea/gitea/releases/tag/v1.17.3)
- [1.17.2-20220908](https://github.com/go-gitea/gitea/releases/tag/v1.17.2)
- [1.17.1-20220822](https://github.com/go-gitea/gitea/releases/tag/v1.17.1)
- [1.17.0-20220801](https://github.com/go-gitea/gitea/releases/tag/v1.17.0)
- [1.16.9-20220730](https://github.com/go-gitea/gitea/releases/tag/v1.16.9)

## 三、获取镜像

推荐从 [Docker Hub Registry](https://hub.docker.com/r/easysoft/gitea) 拉取我们构建好的官方Docker镜像。

```bash
docker pull easysoft/gitea:latest
```

如需使用指定的版本,可以拉取一个包含版本标签的镜像,在Docker Hub仓库中查看 [可用版本列表](https://hub.docker.com/r/easysoft/gitea/tags/)

```bash
docker pull easysoft/gitea:[TAG]
```

## 四、持久化数据

如果你删除容器，所有的数据都将被删除，下次运行镜像时会重新初始化数据。为了避免数据丢失，你应该为容器提供一个挂在卷，这样可以将数据进行持久化存储。

为了数据持久化，你应该挂载持久化目录：

- /data 持久化数据

如果挂载的目录为空，首次启动会自动初始化相关文件

```bash
$ docker run -it \
    -v $PWD/data:/data \
docker pull easysoft/gitea:latest
```

或者修改 docker-compose.yml 文件，添加持久化目录配置

```bash
services:
  Gitea:
  ...
    volumes:
      - /path/to/persistence:/data
  ...
```

## 五、环境变量

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

## 六、运行

### 6.1 单机Docker-compose方式运行

```bash
# 启动服务
make run

# 查看服务状态
make ps

# 查看服务日志
docker-compose logs -f gitea

```

<!-- 这里写应用的【make命令的备注信息】位于文档最后端 -->
**说明:**

- 启动成功后，打开浏览器输入 `http://<你的IP>:8080` 访问管理后台
- 默认用户名：`gitea`，默认密码：`pass4Gitea`
- [VERSION](https://github.com/quicklyon/gitea-docker/blob/main/VERSION) 文件中详细的定义了Makefile可以操作的版本。
- [docker-compose.yml](https://github.com/quicklyon/gitea-docker/blob/main/docker-compose.yml)。

## 七、版本升级

<!-- 这里是应用的【应用升级】信息，通过命令维护，详情参考：https://github.com/quicklyon/doc-toolkit -->
容器镜像已为版本升级做了特殊处理，当检测数据（数据库/持久化文件）版本与镜像内运行的程序版本不一致时，会进行数据库结构的检查，并自动进行数据库升级操作。

因此，升级版本只需要更换镜像版本号即可：

> 修改 docker-compose.yml 文件

```diff
...
  gitea:
-    image: easysoft/gitea:1.17.0-20220729
+    image: easysoft/gitea:1.17.1-20220822
    container_name: gitea
...
```

更新服务

```bash
# 是用新版本镜像更新服务
docker-compose up -d

# 查看服务状态和镜像版本
docker-compose ps
```
