Given /^I have some test data$/ do
 transcription_factor = TranscriptionFactor.find_or_create_by_name("test gene")
 isoform = Isoform.find_or_create_by_name_and_transcription_factor_id("test isoform", transcription_factor.id)
  if User.find_by_email("normal_user@gmail.com").nil?
    FactoryGirl.create(:user, :email => "normal_user@gmail.com", :role => "normal")
  end
  source = Source.find_or_create_by_name("test source")
  pipeline = Pipeline.find_or_create_by_name_and_source_id("test pipeline", source.id)
  reagent_type = ReagentType.find_or_create_by_name("test reagent type")
  reagent = Reagent.find_or_create_by_name_and_reagent_type_id_and_source_id("test reagent", reagent_type.id, source.id)
  1.times do
    Attempt.create!(:reagent_id => reagent.id, :pipeline_id => pipeline.id)
  end
end