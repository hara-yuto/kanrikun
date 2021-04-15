require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER"]
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end


RSpec.describe 'イベント投稿機能', type: :system do
  before do
    @event = FactoryBot.create(:event)
    
  end
  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      basic_pass root_path
      visit root_path
      @user = FactoryBot.create(:user)
      visit  new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with:@user.password
      click_on('Log in')

      # スケジュールを投稿しカレンダーに保存されない
      expect {
        find('input[name="commit"]').click
      }.not_to change { Event.count }

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq(root_path)
    end
  end

  context '投稿に成功したとき' do
  it 'イベントの投稿に成功すると、トップに遷移して、投稿した内容が表示されている' do
    # サインインする
    basic_pass root_path
    visit root_path
    @user = FactoryBot.create(:user)
    visit  new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with:@user.password
    click_on('Log in')
    # スケジュールを投稿しカレンダーに保存される
    post = 'test'
    fill_in 'event_title', with: post
    fill_in 'event_content', with: post
    expect {
      find('input[name="commit"]').click
    }.to change { Event.count }.by(1)
    expect(current_path).to eq(root_path)
    expect(page).to have_content(post)
    
  end
 end
end
RSpec.describe 'イベント編集', type: :system do
  before do
    @event = FactoryBot.create(:event)
    @user = FactoryBot.create(:user)
  end

  context 'イベントが編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿したイベントの編集ができる' do
      basic_pass root_path
      visit root_path
      @user = FactoryBot.create(:user)
      visit  new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with:@user.password
      click_on('Log in')
      # スケジュールを投稿しカレンダーに保存される
      
      fill_in 'event_title', with: @event.title
      fill_in 'event_content', with: @event.content
      expect {
        find('input[name="commit"]').click
      }.to change { Event.count }.by(1)
      
      expect(page).to have_content(@event.title)


      # 詳細ページへ遷移する
      
      click_on(@event.title)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(page).to have_content("#{@event.title}")
      expect(page).to have_content("#{@event.content}")
      #編集ページに遷移
       click_on('編集')

      #投稿情報が反映されているか確認
      expect(page).to have_content("#{@event.title}")
      expect(page).to have_content("#{@event.content}")
      #投稿情報を変更
      fill_in 'title', with:"#{@event.title}+ 変更"
      fill_in 'content', with:"#{@event.content}+変更"
      # 編集してもeventモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Event.count }.by(0)
     
      #Backを押下しトップの内容が変わっているかを確認
        click_on('Back')
        expect(page).to have_content("#{@event.title}+ 変更")
    end
  end
      context 'イベントが編集ができないとき' do
         it 'ログインしたユーザーは自分が投稿したイベントの編集ができない' do
          basic_pass root_path
          visit root_path
          @user = FactoryBot.create(:user)
          visit  new_user_session_path
          fill_in 'user_email', with: @user.email
          fill_in 'user_password', with:@user.password
          click_on('Log in')
          # スケジュールを投稿しカレンダーに保存される
          
          fill_in 'event_title', with: @event.title
          fill_in 'event_content', with: @event.content
          expect {
            find('input[name="commit"]').click
          }.to change { Event.count }.by(1)
          
          expect(page).to have_content(@event.title)
          # 詳細ページへ遷移する
      
           click_on(@event.title)
           # すでに投稿済みの内容がフォームに入っていることを確認する
           expect(page).to have_content("#{@event.title}")
           expect(page).to have_content("#{@event.content}")
           #編集ページに遷移
            click_on('編集')
           #入力不備（タイトルが空）投稿情報を変更できない
            fill_in 'title', with:""
            expect{
              find('input[name="commit"]').click
            }.not_to change { Event.count }

        end
      end
end

RSpec.describe 'イベント削除', type: :system do
        before do
          @event = FactoryBot.create(:event)
          @user = FactoryBot.create(:user)
        end
          context 'イベントを削除する' do
          it 'ログインしたユーザーは自分が投稿したイベントを削除できる' do
            basic_pass root_path
            visit root_path
            @user = FactoryBot.create(:user)
            visit  new_user_session_path
            fill_in 'user_email', with: @user.email
            fill_in 'user_password', with:@user.password
            click_on('Log in')
            # スケジュールを投稿しカレンダーに保存される
            
            fill_in 'event_title', with: @event.title
            fill_in 'event_content', with: @event.content
            expect {
              find('input[name="commit"]').click
            }.to change { Event.count }.by(1)
            
            expect(page).to have_content(@event.title)
      
      
            # 詳細ページへ遷移する
            
            click_on(@event.title)
            # すでに投稿済みの内容がフォームに入っていることを確認する
            expect(page).to have_content("#{@event.title}")
            expect(page).to have_content("#{@event.content}")
            # 投稿を削除するとレコードの数が1減りトップに遷移
            expect{
             click_on('削除')
            }.to change { Event.count }.by(-1)
         end
       end
      end







