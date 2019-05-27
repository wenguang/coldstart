
实现参考：[基于HMAC的rest api鉴权处理](https://www.jianshu.com/p/b0a577708a7b)

HmacFilter过滤器实现了API鉴权功能，鉴权失败即返回报错信息给前端。实现代码见HmacFilter的doFilter方法。前端在fetch.js加了API鉴权的代码，npm install crypto-js 加入cryto-js库
```
import { baseUrl } from './env'
import crypto from 'crypto'
// var crypto = require('crypto');

export default async(url = '', data = {}, type = 'GET', method = 'fetch') => {
    type = type.toUpperCase();
    url = baseUrl + url;

    // API_KEY必要保密处理
    let API_KEY = "haha43420024";
    let apiId = 'cold-start-manage';
    let timestamp = new Date().getTime();

    // Hmac, 以排序过的参数拼接加apiId、timestamp生成Hmac码digest
    // apiId、timestamp、digest都作为参数
    let keys = Object.keys(data).sort();
    let baseString = '';
    keys.forEach(key => {
        baseString += data[key]
    })
    baseString += apiId;
    baseString += timestamp;

    // 创建一个Hmac对象，用的是Hmac-md5算法，key是自己定义的API_KEY
    let hmac = crypto.createHmac('md5', API_KEY);
    // 传入baseString生成hash
    let hash = hmac.update(baseString);
    // 生成hex格式的Hmac摘要
    let digest = hash.digest('hex');

    Object.assign(data, { "apiId": apiId, "timestamp": timestamp, "digest": digest });

    //.....省略
```

