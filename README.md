## 블랙잭 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy

---
## 기능 요구사항

### 블랙잭 게임이란?
딜러와 플레이어 중 카드의 합이 21 또는 21에 가장 가까운 숫자를 가지는 쪽이 이기는 게임

### 게임 규칙
- 게임을 시작하면 플레이어는 두 장의 카드를 지급 받는다.
- 두 장의 카드 숫자를 합쳐 21을 초과하지 않으면서 21에 가깝게 만들면 이긴다.
- 21을 넘지 않을 경우 원한다면 얼마든지 카드를 계속 뽑을 수 있다.

### 카드 숫자 계산 규칙
- 카드의 숫자 계산은 카드 숫자를 기본으로 한다.
- 예외로 Ace는 1 또는 11로 계산할 수 있다.
- King, Queen, Jack은 각각 10으로 계산합니다.

---

## 구현 목록
### View
- InputView
    - [x] 참여자 이름 입력 (쉼표 기준으로 분리)
    - [x] 플레이어별 카드를 더 받을지 선택값 입력 (y, n)
          (y: 새로운 카드 받기, n: 다음 플레이어로 넘어가거나 게임 결과 보기)

<br>

- ResultView
    - [ ] 참여자들이 처음 받은 카드 출력
    - [ ] 추가 선택한 카드를 포함한 모든 카드 출력 - Loop
    - [ ] 게임 결과 출력

<br>

### Business Logic
- 입력된 금액 유효성 검사
    - [x] 입력된 이름이 빈 값인지에 대한 검사
    - [x] 중복되는 이름이 있는지 검사
    - [x] 입력된 이름이 2명 ~ 최대 인원수(5명) 범위에 포함되는지에 대한 검사
    - [x] 입력된 이름이 10자리를 넘어가는지에 대한 검사
    - [x] 카드 선택 시 `y` or `n`이 아닌 경우에 대한 검사

<br>

- Blackjack Card
    - [x] 일반 숫자 카드는 해당 숫자로 계산
    - [x] Ace는 `1` or `11`로 계산
    - [x] King, Queen, Jack은 각각 `10`으로 계산

<br>

- Player
    - [x] 플레이어는 이름과 Blackjack Card 2장을 소유하고 시작한다.
    - [x] 블랙잭 카드를 추가로 받을 수 있다.(Hit)
    - [x] Hit가 가능한지 확인 (21 미만에서만 가능)
    - [x] 소유한 카드의 최적의 총합을 알려준다.
    - [x] 게임 종료 시, 자신의 이름과 갖고있는 카드 그리고 결과 숫자를 알려준다.

<br>

- Dealer
    - [x] 딜러는 처음에 52장의 카드를 소유한다.
    - [x] 중복된 카드를 줄 수 없다. 전달한 카드는 소유한 카드에서 제외된다.
    - [x] 게임 시작 시, 딜을 하면 2장의 카드를 준다.
    - [x] 이후에 추가 딜을 하면 1장의 카드를 준다.

<br>

- Blackjack Game
    - [x] 딜러는 플레이어들에게 두 장의 카드를 지급
    - [ ] 처음에 지급받은 카드를 출력한다.
    - [ ] InputView와 ResultView를 소유
    -  딜러가 모든 플레이어들에게 추가 카드 지급에 대한 확인
        - [ ] 카드를 더 받는다면, 지급받은 카드를 포함한 총 카드 출력 및 추가 지급에 대한 재확인
        - [x] 카드를 더 받지 않는다면, 다음 플레이어 확인
        - [ ] 모든 플레이어가 선택을 완료했다면, 딜러가 게임 결과 출력
