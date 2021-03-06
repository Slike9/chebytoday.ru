require 'test_helper'

class TwitUsersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => TwitUser.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    TwitUser.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    TwitUser.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to twit_user_url(assigns(:twit_user))
  end
  
  def test_edit
    get :edit, :id => TwitUser.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    TwitUser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => TwitUser.first
    assert_template 'edit'
  end
  
  def test_update_valid
    TwitUser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => TwitUser.first
    assert_redirected_to twit_user_url(assigns(:twit_user))
  end
  
  def test_destroy
    twit_user = TwitUser.first
    delete :destroy, :id => twit_user
    assert_redirected_to twit_users_url
    assert !TwitUser.exists?(twit_user.id)
  end
end
