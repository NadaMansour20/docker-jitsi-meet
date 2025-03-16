# استخدمي الصورة الرسمية لـ Jitsi Meet
FROM jitsi/web:stable

# تعيين مسار العمل
WORKDIR /config

# نسخ ملفات Jitsi Meet إلى المسار
COPY . /config

# تعيين نقطة الدخول
ENTRYPOINT ["/config/docker-entrypoint.sh"]
