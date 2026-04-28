# CET-4 Platform 部署指南

## 1. 环境要求

| 组件 | 最低版本 |
|------|---------|
| JDK | 17+ |
| MySQL | 8.0+ |
| Redis | 6.0+ |
| Node.js | 18+（仅前端构建时需要） |

## 2. 后端部署

### 2.1 构建

```bash
cd cet4-backend
mvn clean package -DskipTests
```

产物位于 `target/cet4-backend-0.0.1-SNAPSHOT.jar`。

### 2.2 数据库初始化

```bash
mysql -u root -p cet4_platform < src/main/resources/sql/init.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_users.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_06_set1.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_06_set2.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_06_set3.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_12_set1.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_12_set2.sql
mysql -u root -p cet4_platform < src/main/resources/sql/seed_2025_12_set3.sql
```

### 2.3 生产配置

1. 复制模板：
   ```bash
   cp src/main/resources/application-prod.example.yml \
      src/main/resources/application-prod.yml
   ```

2. 编辑 `application-prod.yml`，填入真实的数据库地址、Redis 地址等。

3. **不要**将 `application-prod.yml` 提交到 Git。

### 2.4 启动

```bash
# 方式一：使用启动脚本
export DB_PASSWORD=your_password
./deploy/start-backend.sh prod

# 方式二：直接 java -jar
export DB_PASSWORD=your_password
java -Xms256m -Xmx512m \
  -Dspring.profiles.active=prod \
  -DDB_PASSWORD="$DB_PASSWORD" \
  -jar target/cet4-backend-0.0.1-SNAPSHOT.jar
```

### 2.5 环境变量

| 变量 | 必填 | 说明 |
|------|------|------|
| `DB_PASSWORD` | ✅ | MySQL 密码 |
| `JWT_SECRET` | ✅ | JWT 签名密钥，生产环境必须设置强随机值 |
| `DB_USERNAME` | ❌ | MySQL 用户名，默认 `root` |
| `DEEPSEEK_API_KEY` | ❌ | DeepSeek AI 接口密钥，未设置时 AI 功能降级 |
| `REDIS_HOST` | ❌ | Redis 地址，默认 `127.0.0.1` |
| `REDIS_PORT` | ❌ | Redis 端口，默认 `6379` |
| `REDIS_PASSWORD` | ❌ | Redis 密码 |

## 3. 前端部署

### 3.1 构建

```bash
cd cet4-frontend
npm install
npm run build
```

产物位于 `dist/` 目录。

### 3.2 Nginx 配置示例

```nginx
server {
    listen 80;
    server_name your-domain.com;

    root /var/www/cet4-frontend/dist;
    index index.html;

    # SPA 路由回退
    location / {
        try_files $uri $uri/ /index.html;
    }

    # API 反向代理
    location /api/ {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## 4. 验证

- 后端健康检查：`curl http://localhost:8080/api/exams`
- 前端页面：浏览器访问 `http://your-domain.com`
