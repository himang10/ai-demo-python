# Python 3.8 베이스 이미지 사용
FROM python:3.8-slim

# 작업 디렉터리 설정
WORKDIR /app

# ffmpeg 및 필요한 패키지 설치
# Python 이미지는 Debian 기반이므로 apt-get 사용
RUN apt-get update \
    && apt-get install -y ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 현재 디렉터리의 파일을 컨테이너의 /app 디렉터리로 복사
COPY *.py /app

# Streamlit과 기타 필요한 Python 패키지 설치
RUN pip3 install openai transformers pandas numpy
RUN pip3 install boto3 tenacity python-dotenv
RUN pip3 install streamlit datetime 
RUN pip3 install streamlit-audiorecorder gtts streamlit-chat 
RUN pip3 install matplotlib scipy plotly scikit-learn

ENV STREAMLIT_SERVER_ENABLE_XSRF_PROTECTION="false"
ENV STREAMLIT_SERVER_ENABLE_CORS="false"


EXPOSE 8080

# 컨테이너가 시작될 때 Streamlit 앱 실행
CMD ["streamlit", "run", "aicode.py", "--server.port=8080"]
