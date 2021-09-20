FROM python:alpine

WORKDIR /app

COPY requirements.txt ./

RUN pip install pip -U && \
    pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "--version" ]