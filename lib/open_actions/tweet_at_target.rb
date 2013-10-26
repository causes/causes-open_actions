module OpenActions
  class TweetAtTarget < OpenActions::OpenAction
    user_auth :twitter

    leader_fields do
      text_field :recipient
      text_area  :message
    end

    action_taker_fields do
      text_area  :message
    end

    copy_strings do
      leader_description '<strong>Tweet at someone</strong> to influence them.'
      action_noun 'tweet'
      action_unit 'tweet'
      call_to_action 'Tweet'
      call_to_action_short 'Tweet'
      create_heading 'Create a tweet'
      cta_incentive 'Add your voice'
      edit_heading 'Edit tweet'
      feed_label 'TWEET'
      general_cta 'tweet'
      impact_verbed 'tweeted'
      invitation_accept 'Tweet'
      inviter_message 'Your voice will make a difference. Tweet with us.'
      not_verbed_this 'did not tweet'
      short_verbed 'tweeted'
      specific_cta 'tweet'
      take_this_action 'tweet'
      usage 'Get more tweets'
      verb 'tweet'
      verbed 'tweeted'
      verbed_a 'sent a tweet'
      verbed_this 'sent this tweet'
      verbing 'sending this tweet'
    end

    def take_action!(data)
      data[:twitter].update "@#{data[:recipient]} #{data[:message]}"
    end
  end
end
