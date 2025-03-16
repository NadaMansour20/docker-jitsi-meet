# استخدمي الصورة الرسمية لـ Jitsi Meet
FROM jitsi/web:stable

# تعيين مسار العمل
WORKDIR /config

# نسخ جميع الملفات إلى المسار الصحيح
COPY . /config

COPY ./web/rootfs/defaults/docker-entrypoint.sh /config/docker-entrypoint.sh

# جعل ملف `docker-entrypoint.sh` قابلاً للتنفيذ
RUN chmod +x /config/docker-entrypoint.sh

# تشغيل `docker-entrypoint.sh` عند بدء التشغيل
ENTRYPOINT ["/config/docker-entrypoint.sh"]


