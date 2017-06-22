AfterStep('@pause') do
  print "Press Return to continue"
  STDIN.getc
end

AfterStep('@slow') do
  sleep 1 #seconds
end

# setup the output data and directory
output = OpenStruct.new(date:Time.now)
output.directory = "test_output/runs/#{output.date.strftime('%Y%m%d_%H%M%S')}"
FileUtils.mkdir_p(output.directory) unless File.directory?(output.directory)
output.scenarios = []

Before do |sc|
  output.current_sc = OpenStruct.new(screenshots:[])
end

After do |sc|
  output.current_sc.name = sc.name
  output.current_sc.passed = sc.passed?
  output.current_sc.exception = sc.failed? ? sc.exception.message : nil
  output.current_sc.steps = sc.test_steps.map{|s|s.name}.select{|s|s[-4..-1] != "hook"}
  output.scenarios << output.current_sc.to_h
end

AfterStep do |sc|
  @step ||=0
  screenshot_filename = Time.now.strftime('%H%M%S%L') + ".png"
  page.save_screenshot output.directory + "/" + screenshot_filename
  output.current_sc.screenshots << screenshot_filename
  @step +=1
end

at_exit do
  output.total_scenarios =  output.scenarios.length
  output.passed_scenarios = output.scenarios.select{|r|r[:passed]}.length
  output.all_passed = (output.total_scenarios == output.passed_scenarios)
  File.open("#{output.directory}/output.json","w") do |f|
    f.write(output.to_h.to_json)
  end
end
