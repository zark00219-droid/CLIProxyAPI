使用 Ubuntu 基礎映像檔
FROM ubuntu:22.04
安裝 wget、tar 等下載工具
RUN apt-get update && apt-get install -y 
wget 
ca-certificates 
&& rm -rf /var/lib/apt/lists/*
工作目錄
WORKDIR /app
[關鍵] 讓 Render 在每次啟動時，自動從 GitHub Release 下載對應版本的 Linux 執行檔
RUN wget https://github.com/router-for-me/CLIProxyAPI/releases/download/v7.3.15/CLIProxyAPI_7.3.15_linux_amd64.tar.gz 
&& tar -zxvf CLIProxyAPI_7.3.15_linux_amd64.tar.gz 
&& chmod +x cliproxyapi
暴露對外連接埠
EXPOSE 7860
啟動服務（請根據您實際解壓縮出來的執行檔名稱調整，通常為 cliproxyapi 或 cli-proxy-api）
CMD ["./cliproxyapi", "--port", "7860"]
