FROM python:3.12-slim


ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


WORKDIR /app


RUN addgroup --system hyrcania \
    && adduser --system --ingroup hyrcania hyrcania


COPY app/requirements.txt .


RUN pip install --no-cache-dir -r requirements.txt


COPY app/ .


RUN chown -R hyrcania:hyrcania /app


USER hyrcania


EXPOSE 5000


CMD ["python", "app.py"]