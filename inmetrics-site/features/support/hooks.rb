After do |scenario|
    add_screenshot(scenario)
    if scenario.failed?
        add_browser_logs
    end
 end

 def add_screenshot(scenario)
    nome_cenario = scenario.name.gsub(/[^A-Za-z0-9]/, '')
    nome_cenario = nome_cenario.gsub(' ','_').downcase!
    screenshot = "report/screenshots/#{nome_cenario}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Evidência)')
 end

 def add_browser_logs
    time_now = Time.now
    current_url = Capybara.current_url.to_s
    logs = page.driver.browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
    logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
    logs.any? == true
    embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end

at_exit do
    time = Time.now.getutc
    ReportBuilder.configure do |config|
    config.json_path = 'report.json'
    config.report_path = 'cucumber_web_report'
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = 'Cucumber Report Builder Web Automation Test Results'
    config.compress_images = false
    config.additional_info = { 'Project name' => 'Test', 'Platform' => 'Integration', 'Report generated' => time }
    end
    ReportBuilder.build_report
end