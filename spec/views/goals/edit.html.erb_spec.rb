# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'goals/edit', type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
                            belongs_to: '',
                            goal: 'MyString',
                            status: 'MyString'
                          ))
  end

  it 'renders the edit goal form' do
    render

    assert_select 'form[action=?][method=?]', goal_path(@goal), 'post' do
      assert_select 'input[name=?]', 'goal[belongs_to]'

      assert_select 'input[name=?]', 'goal[goal]'

      assert_select 'input[name=?]', 'goal[status]'
    end
  end
end
