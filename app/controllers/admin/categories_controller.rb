class Admin::CategoriesController < ApplicationController
  before_aciton :authenticate_user!
  before_action :authenticate_admin
end
