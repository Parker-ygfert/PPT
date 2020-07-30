# Model => Post
  - title:stirng, 必填
  - content:text
  - board_id:integer, 必填
      board_id:integer
      board_referances
      board:belongs_to
  - deleted_at:datetime, default: nil, :index
  - ip_address:string, 必填
  - serail:string, :unique