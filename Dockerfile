# 공식 Python 런타임을 부모 이미지로 사용
FROM amdp-registry.skamdp.org/mydev-ywyi/ai-python:1.1.0

# 작업 디렉토리 설정
WORKDIR /app

# 앱 소스 코드를 컨테이너로 복사
COPY *.py /app/aicode.py

# 포트 8501 노출 (Streamlit의 기본 포트)
EXPOSE 8080

# Streamlit 실행
CMD ["streamlit", "run", "aicode.py", "--server.port=8080"]
