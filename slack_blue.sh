# slack-web-hook URL 세팅
slack_web_hook="........."

# 배포 중 문제가 발생했다는 내용의 로그를 남겨준다.echo "blue 배포 중 문제 발생 : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)" >> /home/ubuntu/deploy.log
echo "관리자 알람 발송 : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)" >> /home/ubuntu/deploy.log

# 슬랙으로 보낼 메시지를 변수에 저장해준다.
json="{ \"text\": \"blue  배포 중 문제가 발생하여 배포가 비정상 중단되었으니 확>인 부탁드립니다 -> 문제 발생 시각: $(date '+%Y-%m-%d %H:%M:%S')\" }"

# 변수에 메시지가 잘 입력되었는지 콘솔 창에 출력해본다.echo "json: $json"

# 슬랙으로 메시지를 발송한다.
curl -X POST -H 'Content-type: application/json' --data "$json" "$slack_web_hook"

# 슬랙 알람 발송 이후 배포 비정상종료 로그를 남겨준다.echo "관리자 알람 발송 완료, 배포 비정상종료 : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)" >> /home/ubuntu/deploy.log