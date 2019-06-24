package com.dvs.rearend.common.util;

import org.apache.commons.codec.binary.Hex;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * AES加解密工具类
 * Created by shuzheng on 2017/2/5.
 */
public class AESUtil {

    private static final String ENCODE_RULES = "zheng";

    private final static String API_KEY = "haha43420024";

    /**
     * 加密
     * 1.构造密钥生成器
     * 2.根据ecnodeRules规则初始化密钥生成器
     * 3.产生密钥
     * 4.创建和初始化密码器
     * 5.内容加密
     * 6.返回字符串
     */
    public static String aesEncode(String content) {
        try {
            //1.构造密钥生成器，指定为AES算法,不区分大小写
            KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
            //2.根据ecnodeRules规则初始化密钥生成器
            //生成一个128位的随机源,根据传入的字节数组
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            random.setSeed(ENCODE_RULES.getBytes());
            keyGenerator.init(128, random);
            //3.产生原始对称密钥
            SecretKey originalKey = keyGenerator.generateKey();
            //4.获得原始对称密钥的字节数组
            byte[] raw = originalKey.getEncoded();
            //5.根据字节数组生成AES密钥
            SecretKey key = new SecretKeySpec(raw, "AES");
            //6.根据指定算法AES自成密码器
            Cipher cipher = Cipher.getInstance("AES");
            //7.初始化密码器，第一个参数为加密(Encrypt_mode)或者解密解密(Decrypt_mode)操作，第二个参数为使用的KEY
            cipher.init(Cipher.ENCRYPT_MODE, key);
            //8.获取加密内容的字节数组(这里要设置为utf-8)不然内容中如果有中文和英文混合中文就会解密为乱码
            byte[] byteEncode = content.getBytes("utf-8");
            //9.根据密码器的初始化方式--加密：将数据加密
            byte[] byteAES = cipher.doFinal(byteEncode);
            //10.将加密后的数据转换为字符串
            //这里用Base64Encoder中会找不到包
            //解决办法：
            //在项目的Build path中先移除JRE System Library，再添加库JRE System Library，重新编译后就一切正常了。
            String aesEncode = new String(new BASE64Encoder().encode(byteAES));
            //11.将字符串返回
            return aesEncode;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //如果有错就返加nulll
        return null;
    }

    /**
     * 解密
     * 解密过程：
     * 1.同加密1-4步
     * 2.将加密后的字符串反纺成byte[]数组
     * 3.将加密内容解密
     */
    public static String aesDecode(String content) {
        try {
            //1.构造密钥生成器，指定为AES算法,不区分大小写
            KeyGenerator keygen = KeyGenerator.getInstance("AES");
            //2.根据ecnodeRules规则初始化密钥生成器
            //生成一个128位的随机源,根据传入的字节数组
            SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
            random.setSeed(ENCODE_RULES.getBytes());
            keygen.init(128, random);
            //3.产生原始对称密钥
            SecretKey originalKey = keygen.generateKey();
            //4.获得原始对称密钥的字节数组
            byte[] raw = originalKey.getEncoded();
            //5.根据字节数组生成AES密钥
            SecretKey key = new SecretKeySpec(raw, "AES");
            //6.根据指定算法AES自成密码器
            Cipher cipher = Cipher.getInstance("AES");
            //7.初始化密码器，第一个参数为加密(Encrypt_mode)或者解密(Decrypt_mode)操作，第二个参数为使用的KEY
            cipher.init(Cipher.DECRYPT_MODE, key);
            //8.将加密并编码后的内容解码成字节数组
            byte[] byteContent = new BASE64Decoder().decodeBuffer(content);
            /*
             * 解密
             */
            byte[] byteDecode = cipher.doFinal(byteContent);
            String aesDecode = new String(byteDecode, "utf-8");
            return aesDecode;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            throw new RuntimeException("兄弟，配置文件中的密码需要使用AES加密，请使用com.zheng.common.util.AESUtil工具类修改这些值！");
            //e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        }
        //如果有错就返加nulll
        return null;
    }

    /**
     *  使用HMAC摘要算法和秘钥API KEY生成数组摘要
     */
    public static String hmacDigest(String data) {

        String checksum = null;
        try {
            byte[] appKeyByte = API_KEY.getBytes("UTF-8");
            byte[] dataByte = data.getBytes("UTF-8");
            SecretKey secretKey = new SecretKeySpec(appKeyByte, "HmacMD5");

            Mac mac = Mac.getInstance("HmacMD5");
            mac.init(secretKey);
            byte[] doFinal = mac.doFinal(dataByte);
            byte[] hexB = new Hex().encode(doFinal);

            checksum = new String(hexB);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return checksum;
    }

    public static void main(String[] args) {
        String[] keys = {
                "mj43420024", "123456"
        };
        System.out.println("key | AESEncode | AESDecode");
        for (String key : keys) {
            System.out.print(key + " | ");
            String encryptString = aesEncode(key);
            System.out.print(encryptString + " | ");
            String decryptString = aesDecode(encryptString);
            System.out.println(decryptString);
        }

        System.out.println("----------------");
        // 测试list排序
        List<String> list = new ArrayList<>();
        list.add("ccaa");
        list.add("zzya");
        list.add("oobp");
        list.add("aayy");
        list.add("aabb");
        for (int i=0; i<list.size(); i++) {
            System.out.println(list.get(i));
        }
        System.out.println("----------------");
        Collections.sort(list);
        for (int i=0; i<list.size(); i++) {
            System.out.println(list.get(i));
        }

        System.out.println("----------------");

        // 测试Hmac-md5算法
        System.out.println(hmacDigest("123456"));

    }

}
