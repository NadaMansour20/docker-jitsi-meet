# استخدم الصورة الرسمية لـ Jitsi Meet كصورة أساسية
FROM jitsi/web:stable

# تعيين المتغيرات البيئية بناءً على الإعدادات في ملف .env أو البيئة لديك
ENV CONFIG=/config
ENV HTTP_PORT=9090
ENV HTTPS_PORT=8443
ENV TZ=UTC
ENV PUBLIC_URL=https://meet.example.com:${HTTPS_PORT}
ENV JVB_ADVERTISE_IPS=192.168.1.1,1.2.3.4
ENV ENABLE_AUTH=1
ENV ENABLE_GUESTS=1
ENV AUTH_TYPE=internal

# تعيين بيانات الاعتماد الخاصة بالمصادقة
ENV JICOFO_AUTH_PASSWORD=01149441801@2072003
ENV JVB_AUTH_PASSWORD=01149441801@2072003
ENV JIGASI_XMPP_PASSWORD=""
ENV JIBRI_XMPP_PASSWORD=""
ENV JIBRI_RECORDER_PASSWORD=""

# تمكين Let's Encrypt إذا كنت تحتاج إليه
ENV ENABLE_LETSENCRYPT=1
ENV LETSENCRYPT_EMAIL=alice@atlanta.net
ENV LETSENCRYPT_DOMAIN=meet.example.com

# فتح المنافذ المطلوبة لـ HTTP و HTTPS
EXPOSE 9090
EXPOSE 8443

# تعيين الدليل العامل في الحاوية
WORKDIR /usr/share/jitsi-meet

# إذا كنت بحاجة لتثبيت أي تبعيات إضافية، يمكن إضافة سطور التثبيت هنا
# RUN apt-get update && apt-get install -y <package_name>

# نسخ ملفات التكوين من النظام المحلي إلى الحاوية
COPY ./config /config

# تأكد من أن جميع ملفات البيئة مثل .env وملفات التكوين الأخرى موجودة في الدليل المناسب
# سيتم نسخها من الدليل المحلي إلى الحاوية كما في السطر السابق

# بدء خدمة Jitsi Meet
CMD ["bash", "/config/start.sh"]
