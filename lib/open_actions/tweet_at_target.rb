module OpenActions
  class TweetAtTarget < OpenActions::OpenAction
    user_auth :twitter

    leader_fields do
      text_field :recipient
      text_area  :message_text
    end

    action_taker_fields do
      text_area  :message_text
    end

    copy_strings do
      noun 'tweet'
      leader_description '<strong>Tweet at someone</strong> to influence them.'
    end
  end
end
