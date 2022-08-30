// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ExampleController from "./example_controller"
application.register("example", ExampleController)

import ResetFormController from "./reset_form_controller"
application.register("reset-form", ResetFormController)

import AutoScrollController from "./auto_scroll_controller"
application.register("auto-scroll", AutoScrollController)