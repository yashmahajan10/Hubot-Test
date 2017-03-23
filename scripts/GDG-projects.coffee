# Description:
#   GDG-Projects
#
# Dependencies:
#   "cheerio: "0.7.0"
#
# Configuration:
#   None
# 
# Commands:
#  hubot list-projects - lists all the project ideas on project.gdgvitvellore.com
#
# Author:
#   yashmahajan10

cheerio = require('cheerio')

module.exports = (robot) ->
  URL = 'http://projects.gdgvitvellore.com/'
  robot.respond /list-projects/i, (msg) ->
      msg.http(URL).get() (err, res, body) ->
        $=cheerio.load(body)
        $('.job-list li').each ->
          msg.send "#{$(this).children().first().text().trim()}"
        