# docker-php55
阿里云自动构建 版本php55



### Release:

- 1.0.1:初始版本

- 1.0.3: 添加mycrypt

### 使用示例：
  
```Dockerfile
FROM registry.cn-shenzhen.aliyuncs.com/canbefree/docker-php55:1.0.1
```

# tag添加方式

  
``` 
    git tag -a release-v1.0.3 -m "Update ...."
    git push origin --tags
```

```bash
# 删除本地
git tag -d v1.0.0
#删除远程的
git push origin :refs/tags/release-v1.0.3
```