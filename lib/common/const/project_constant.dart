class ProjectConstant {
  static const ACCESS_TOKEN = 'access_token';
  static const REFRESH_TOKEN = 'refresh_token';
  static const EXPIRES_IN = 'expires_in';
  static const LOING_TIME = 'login_time';
  static const USER_ID = 'user_id'; // access_token 로직 적용 전 request body에 user_id 실어서 요청 보냄

  static const AUTO_LOGIN_YN = 'auto_login_YN';

  static const TUTORIAL_FLAG = 'tutorial_flag'; // 튜토리얼 플래그

  static const BASE_URL = 'http://133.186.134.15:8080/web'; // 이 부분 작성하여 테스트할 것!!!

  static const PRIVATE_URL = 'https://sedate-deposit-cd0.notion.site/e9fa4d05790048938153dd824c4a8b4c?pvs=4'; // 개인정보처리방침

  static const TERMS_OF_SERVICE_URL = 'https://sedate-deposit-cd0.notion.site/e531f8017a2c4a94bf983bc7b5db8bc1';

  static const INPUT_CODE_00 = '00'; // 초기값
  static const INPUT_CODE_01 = '01'; // 입력값 없음
  static const INPUT_CODE_02 = '02'; // 입력값 길이 오류
  static const INPUT_CODE_03 = '03'; // 입력값 형식 오류
  static const INPUT_CODE_04 = '04'; // 입력값 불일치
  static const INPUT_CODE_05 = '05'; // 입력값 중복 오류
  static const INPUT_CODE_06 = '06'; // 입력값 변화없음 오류 (수정 시 사용)
  /* 필요 시 코드 추가 */
  static const INPUT_CODE_09 = '09'; // 입력값 유효성 검증 성공 (API 요청 전)
  static const INPUT_CODE_10 = '10'; // 입력값 API 요청 결과 성공 (API 요청 후)
  static const INPUT_CODE_11 = '11'; // 입력값 API 요청 결과 실패 (의도한 결과가 아닐 때)
  static const INPUT_CODE_12 = '12'; // 입력값 API 요청 완료 (이미 통과한 경우)
  static const INPUT_CODE_13 = '13'; // 기타 오류


  static const INQUIRY_URL = 'https://forms.gle/jLwDyTkMSKF3eVVh9'; // 문의하기 링크
}
