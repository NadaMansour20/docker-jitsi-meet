# استخدام صورة Jitsi Web الرسمية كصورة أساسية
FROM jitsi/web:stable

# تحديد إعدادات البيئة
ENV AMPLITUDE_ID=${AMPLITUDE_ID} \
    ANALYTICS_SCRIPT_URLS=${ANALYTICS_SCRIPT_URLS} \
    AUDIO_QUALITY_OPUS_BITRATE=${AUDIO_QUALITY_OPUS_BITRATE} \
    ENABLE_ADAPTIVE_MODE=${ENABLE_ADAPTIVE_MODE} \
    ENABLE_E2EPING=${ENABLE_E2EPING} \
    ENABLE_STATS_ID=${ENABLE_STATS_ID} \
    PUBLIC_URL=${PUBLIC_URL} \
    RESOLUTION=${RESOLUTION} \
    TZ=${TZ}

# نسخ الملفات المحلية إلى الحاوية
COPY ${CONFIG}/web /config
COPY ${CONFIG}/web/crontabs /var/spool/cron/crontabs
COPY ${CONFIG}/transcripts /usr/share/jitsi-meet/transcripts
COPY ${CONFIG}/web/load-test /usr/share/jitsi-meet/load-test

# تعيين المجلدات الصحيحة للصلاحيات
RUN chmod -R 755 /config && \
    chmod -R 755 /usr/share/jitsi-meet

# تعيين المنافذ التي سيتم تشغيلها
EXPOSE 80 443

# تحديد الأمر الذي يتم تنفيذه عند بدء الحاوية
CMD ["bash", "-c", "exec /usr/share/jitsi-meet/prosody"]
