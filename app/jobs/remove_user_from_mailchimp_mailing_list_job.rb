class RemoveUserFromMailchimpMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    gb = Gibbon::Request.new
    gb.lists(ENV["MAILCHIMP_LIST_ID"]).members(Digest::MD5.hexdigest(user.email.downcase)).delete
  end
end
