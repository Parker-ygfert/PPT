- Model Board
  - `title:string`
  - `intro:text`
  - `state:string(default: normal, disable, hidden)`
  - `is_deleted:boolean`
  - `deleted_at:datetime(default: nil)` <-- index 13:55/0723
  > 與 `is_deleted` 相比會比較佔空間，但可以清楚知道何時被刪除

  - db/migrate (建立 boards 表格)

- Controller Users
  - `#new` (新增資料)
    - `@user = User.new`

  - `#create` (建立資料)
    - `@user = User.new(user_params)`
      - `params.require(:user).permit(:account, :name,:address, :email, :age)`
    - `if @user.save`
      ` redirect_to '/users', notice: ''`
      `else`
      ` render :new`
      `end`

  - `#update`
    - `@user = User.find_by(id: params[:id])`
    > `find(params[:id])` (透過 id 尋找一筆資料)
    > `find_by(id: params[:id])` (透過 搜索條件 尋找一筆資料)

- Controller Posts

- Model User acount:string name:string address:string email:string age:integer
- Model Post 





- Billboard ?
- Favourite ?
- Category ?
- Chat ?

