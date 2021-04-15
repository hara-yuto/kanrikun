require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'スケジュール投稿' do
    before do
      @event = FactoryBot.build(:event)
    end

    context 'スケジュール登録できるとき' do
      it '全て存在していれば登録できる' do
        expect(@event).to be_valid
      end

      it 'worktimeが空でも登録できる' do
        @event.worktime = ''
        expect(@event).to be_valid
      end
    end

    context 'スケジュール登録できないとき' do
      it 'タイトルが空では登録できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では登録できない' do
        @event.content = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Content can't be blank")
      end

      it 'work_timeが全角数字では登録できない' do
        @event.worktime = '２'
        @event.valid?
        expect(@event.errors.full_messages).to include('Worktime is invalid')
      end

      it 'work_timeが全角英字では登録できない' do
        @event.worktime = 'A'
        @event.valid?
        expect(@event.errors.full_messages).to include('Worktime is invalid')
      end

      it 'work_timeが半角英字では登録できない' do
        @event.worktime = 'a'
        @event.valid?
        expect(@event.errors.full_messages).to include('Worktime is invalid')
      end
    end
  end
end
