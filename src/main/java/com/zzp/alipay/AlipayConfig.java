package com.zzp.alipay;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2021000117632017";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCnjltSfjeHAmyqSPOOFtr3hW8HE/RX0Fd3PBpRsmCr+eC63eDMli4tcZRZfC5wU6dFtyME9f2m1rgSSegdkvVEhasBoxflAfPmoGB4OfnhcMapY0jJbpJ1V44DaVKzrgLzgaA5td8lr7KB6XbpV132CC/QWOdryyEmwL8b5QimVj8OhA1MnbKO3w3UfgFutVi4UWS6tbcVaRdm1GUxGTPlJ3CmoabTGJc0XJvom74q2MwDWIO3TgR0IWIWldZd9O2mLsH+T3DSL3ZnrOULzFFcmr8kvSZXgtqsLTm+tOw14jWxhxcd6IvVEmazf9oSTiw8QgJyhjBqmuT82U1/ZSR1AgMBAAECggEAUy+pBS6msL+yZWRsjtmoAoVblv8AK2zDT+4l/vN5bUhUm1G23ruc13DxPvAZOik9/a2rlDXwpZkqr+HDfJNOc6ONP/XR0h+DELgEzQuzlIpiBwzEwUTFL761QdpTdeNpka2Ed8JktBgjnr3jDHwUqSZtXpoU4v5pSg0dlGLERZfzLfvBEILLKjMVbO8pGrZ/fFoDLA+wLlYNatRfgXUR7HgzCOhKVMBkCznnjOB288rTJHZi8GhaWDdXLP1c8bE/xfhOVYbtGYUGJvNWiahXnKPmSfwIhZyM6VdLzjNUGWcWbo30ZiootbP10tHfvcrH8mP3URRJ0BRIkj5Cfqi2wQKBgQDnj5ZOlg4rUQpzmZTLO56sEWQ8ESL3kP0CkIL5zR4/jPjCBc27gYATilGL6c3V+LSZ0YeZdHje0fbTajP8AS/RhahI3m1AEp5HGfN9E2VZxrIh08o+uMUezyFc3rCWsTGT2Sp85IcZ/sE9TSLya2wFwl/iZPPVo7Ibr8HOHdmrMQKBgQC5PXW6BZBjcTzhKuUixEV6uR7/jz+E1HYPVqFnEIMraHnXQfAFjt2k1KoVbQrSeGt49PIBLJhujqHvVCeNR4xs5dpuCDLtMsTXLr6EN2LfqMOesarOfhqwkuOd83cqJvcdYAKh8xV299pX6sBuJENgdi+ggUv+AsKbGKczPk10hQKBgGO0rPi7nfBC3eg2uh3kVwcqGenPSyokMP04slzTWHHuxnHsw9A4C6jeRwyiqLG4fDM7SFLoFt+CsvAHa8jXzfo+vd5af9o16hcdcn1pq5tDdhIgupXVQ3NnpqrxbEIGnB1YRfYvBIlJ63T00NZnMMUuE9FMvL1B1gAb5qxUqBQRAoGAety01OkT16EnzADzcZfUrY1TbhXI/4UbuRiwfPeKyKPHDGsDk+wqPkV/ei6U2vxb7CIq0XSOteWMqnyary4hiaj6s7hkbscZn8+1NWS3A7mf5gXZUJR7h1ol9oGhLCgkByvDEz9zoTDLdTyS3XrX5Yb+F+sqSBP0l4JGg8py/TECgYEA4AOhrtge8DGNoo9PoJxala09/GsAY9p0Hc3PLsY1xIxkaGxfoqrwDgNK31DPV9P7UFwu2tuIFxBDfC6IEQgB+//Y9zTdHL/WRZqzrDjb8xrBZmvH22DHuStqCEV1YZskzn+Rn8kMCH35t5D8AyFCFCVh4R8tSaN7B1lEdnVbRPo=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvMZEVpAAohaEdE0Ap74Oi8GErQ1Kmsx9NkBDj7fdvx80QprOb2lFOmcoaJFgqzCGhIgY+MUqCJHnX+w4HHxmnrum00dThw6HZl4JAlV/kM3h54pF86VUrLBvZJmwumgoCe1+GidToBTXZiN6smgPma04DozaSMpBkCzh98/kBXE07fl9NniAi4Xa7HXlOWvoHUoxk8MwlH5F1zF+v5+3/5dOWm7zMcJXOT0/CZyHfJ0EnqI4wvwWAEzYPZxZXVAaa6i5eROtuNJ4GNv+70CxtnTJzPvHEP/254hH9llqp7eCYJnj4LFULD5W7LCUmCSrDDt8SZgL2P/M7MGSmQUz7QIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	//public static String return_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";
	public static String return_url = "http://localhost:8080/express/alipay/return_url";
	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";

//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑


    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

