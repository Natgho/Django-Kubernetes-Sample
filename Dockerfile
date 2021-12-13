# python 3 kutuphanesinden base imajı cek
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
# docker'in calisacagi dizine gec
WORKDIR /code
# projenin ihtiyac duydugu bagimliliklari calisma dizinine tasi
COPY requirements.txt /code/
# bagimliliklari yukle
RUN pip install -r requirements.txt
# projeyi calisma dizinine tasi
COPY . /code/
# varolan DB operasyonlarini tetikle
RUN python manage.py migrate
# 8000 portunu disari ac
EXPOSE 8000
# django app i baslat
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]