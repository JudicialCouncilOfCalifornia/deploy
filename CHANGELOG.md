# Change Log

## [0.2.70] - 2018-06-14
### Changed
- Calls to `force_ask()` and calls actions now result in more
  persistent variable seeking.
- Improved editing of lists.
### Fixed
- Using `show if` with `datatype: file`.
- Using `show if` with a value of `0`.

## [0.2.69] - 2018-06-12
### Fixed
- Section headers with hyperlinks.
- Google Drive with a large number of files.

## [0.2.68] - 2018-06-10
### Fixed
- Problems with Google Drive timestamps when cloud storage in use.
- Invalid use of echo in Dockerfile.

## [0.2.67] - 2018-06-09
### Changed
- When a non-text field is not required, and the user does not provide
  a value, the variable will be set to `None`.
- Required field markers show differently in some contexts.
- Additional log messages for Google Drive.
### Added
- New Debian dependencies `ttf-mscorefonts-installer`,
  `fonts-ebgaramond-extra`, `ttf-liberation`, and `fonts-liberation`
  in Docker.
### Fixed
- Problems with Google Drive initial set-up.

## [0.2.66] - 2018-06-07
### Changed
- Code editing boxes are now sized relative to screen size.

## [0.2.65] - 2018-06-06
### Added
- Login via Auth0.
### Fixed
- Better error handling after uploads.
- Better error handling during software updates.

## [0.2.64] - 2018-05-31
### Added
- Feature for uploading files through dataurls to the Template Folder
  of the Playground.
### Changed
- Comboboxes now accept free text input.
### Fixed
- PDF bookmarks restored after inserting images.

## [0.2.63] - 2018-05-25
### Added
- The `error notification email` configuration option.
### Fixed
- Error with PDF fields and signature overlay.

## [0.2.62] - 2018-05-23
### Added
- JSON interface to the "Variables, etc." and list of Playground
  files.
### Fixed
- Error during invitation and registration.

## [0.2.61] - 2018-05-19
### Changed
- The `disable others` directive now accepts a list of fields.
- Most natural language functions now accept an optional keyword
  parameter `language`.
- The `country` and `subdivisionfirst` database fields have longer
  allowable lengths.
- Additional system phrases are translatable.

## [0.2.60] - 2018-05-15
### Fixed
- Error on registration page.

## [0.2.59] - 2018-05-15
### Added
- Horizontal navigation bar option.
- Option for disabling the `pip` cache when installing a package.
- The `validation_error()` function and the `DAValidationError` error
  type.
### Changed
- The `interview_list()` function now returns `temp_user_id`.
### Fixed
- PDF assembly resulted in a missing AcroForm error in some circumstances.
- PyPI publishing code used out-of-date upload URL.
- Deleting session in multi-user interview deleted sessions for all
  users.
- Visiting registration page while logged in did not redirect to My
  Interviews page.
- An inappropriate error was raised about `validate` input validation
  functions for certain input types and values.

## [0.2.58] - 2018-05-08
### Added
- Version number on the Package Management page.
### Fixed
- Problem with checkboxes inside of `show if`.
- CSS problem with the "required" asterisk.

## [0.2.57] - 2018-05-07
### Added
- The `validation_error()` function.
- The `num_pages()` method on `DAFile`, `DAFileList`, and
  `DAFileCollection` objects.
### Changed
- On the mobile `signature` page, the "Clear" button is replaced with
  a "Back" button.
- Python `validate` code now works on document uploads.
### Fixed
- The `question back button` was missing from the buttons on the
  desktop `signature` page.
- Problem with spacing of the `question back button` next to other
  buttons.

## [0.2.56] - 2018-05-07
### Changed
- The `min` and `max` field modifiers on `datatype: date` fields now
  accept a wider range of date formats.

## [0.2.55] - 2018-05-06
### Changed
- The `DACloudStorage` object can now be initialized to use
  Configuration directives other than `s3` and `azure`.
- The `min` and `max` field modifiers now work with `datatype: date`.
### Added
- The `slurp()` method for `DAStaticFile` objects.
- Support for editing HTML and other text file formats in the Static
  Files folder of the Playground.
### Fixed
- List of branches in pull-down cut off at a certain length.
- Live Help had problems with encryption.
- Missing help button on `field` with `choices`.

## [0.2.54] - 2018-05-05
### Fixed
- Bug in `set_info()`.

## [0.2.53] - 2018-05-02
### Changed
- Social logins now populate first and last name in the user profile.
- The `all_variables()` function now has an optional keyword argument
  `special` that returns information about an interview that is not
  stored in the variables.
### Added
- Support for `long_description` in setup.py files.
### Fixed
- Update button in `/updatepackage` reverted package to `master`
  branch.
- Unicode problem in `/logs`.

## [0.2.52] - 2018-05-01
### Fixed
- The setup.py file for `docassemble.webapp` did not depend on
  particular versions of `docassemble.base` and `docassemble`.

## [0.2.51] - 2018-05-01
### Changed
- The `advocate` privilege grants access to see user information using
  the API.
- The `interview_list()` function and `/api/interviews` API now act
  upon interviews of anonymous users.
### Fixed
- Questions not centered on screen when navigation bar in use but empty.
- Google Places API populating `unit` with `subpremise` and leaving
  `city` blank.

## [0.2.50] - 2018-04-28
### Changed
- Upgraded user interface from Bootstrap 3.3 to Bootstrap 4.0.0.
- Headless Chrome now used by default in `lettuce` tests.
### Added
- The `show dispatch link` Configuration directive.
### Fixed
- Exception triggered by importation of word translation files with
  YAML errors.
- The `indefinite_article()` function used "a" for any capitalized
  word.
- Issue where Chrome extensions interfered with file uploads.

## [0.2.49] - 2018-04-15
### Fixed
- Use of deprecated flag when calling `pip`.

## [0.2.48] - 2018-04-14
### Changed
- The `Address` methods no longer require `.city` to be defined.
- The `Address` object and the `address autocomplete` feature now
  use more of the possible address components of addresses returned by
  the Google APIs.
### Fixed
- Bug in code for getting temporary URLs to cloud storage.

## [0.2.47] - 2018-04-12
### Fixed
- Problem with quoting glossary terms in HTML.

## [0.2.46] - 2018-04-11
### Fixed
- Bug in new `show if` code.

## [0.2.45] - 2018-04-11
### Fixed
- Identification of names of ZIP files uploaded through Package Management.
- Exception raised by Unicode non-breaking spaces in interview files.
- The `show if` JavaScript feature now works with checkbox values.

## [0.2.44] - 2018-03-31
### Added
- The `analytics id` subdirective of the `google` Configuration directive.
### Changed
- Nested `show if`s are supported.
### Fixed
- Exception caused by mandatory `review` blocks without an `event`,
  `field`, or `sets`.

## [0.2.43] - 2018-03-28
### Changed
- JavaScript specific to a question now executes after `raw global javascript`.
### Fixed
- Exception caused by ampersands in docx template field values.
- Exception caused by unicode in parameters passed to `include_docx_template()`.
- Place Autocomplete returning `undefined` for some address components.

## [0.2.42] - 2018-03-25
### Added
- The `zip_file()` function.
- The `allow downloading` modifier.
- The `centered` feature.
- The `right` question part.
### Changed
- The `allow emailing` modifier now accepts Python code.
- Margins in navigation bar.
### Fixed
- Version of `Flask-User`.

## [0.2.41] - 2018-03-24
### Added
- The `DACloudStorage` and `DAGoogleAPI` objects.
- The `/api/file/<file_number>` API.
- The `delete_variables` option for the POST operation of the `/api/session` API.
### Changed
- Less stringent input sanitation so that Playground files with
  parentheses can be deleted.
- Labels inside buttons will now wrap.
### Fixed
- Escaping of anchor text in `DALink`s.

## [0.2.40] - 2018-03-19
### Added
- The `.complete_elements()` method of `DAList` and `DADict`.
### Fixed
- Removed any dependency on `import pip`.

## [0.2.39] - 2018-03-15
### Changed
- The `review` block can now be used with `field` instead of `event`.
- Temporarily removed warning about `content file`.
### Fixed
- Issue with pressing enter causing two screens to submit.

## [0.2.38] - 2018-03-14
### Added
- The `show interviews link` configuration directive.
### Changed
- The user profile link in the menu will always be shown if the user
  has `admin` privileges.
- Different formatting of user list.
- Author name and e-mail in "Packages" folder of Playground.
### Fixed
- Problem with `show if` not recognizing `False` value of checkbox
  yes/no field.

## [0.2.37] - 2018-03-10
### Added
- Example for `user_logged_in()`.
- Example for appending a row to a Google Sheet.
- The `scale` option for the `range` datatype.
### Changed
- The `include_docx_template()` function accepts keyword parameters.
  This has the effect of including Jinja2 `set` commands at the
  beginning of the included sub-document.
### Fixed
- Error when registering.

## [0.2.36] - 2018-03-08
### Added
- The `DALink` object type, which allows hyperlinks to be inserted
  into .docx files.
### Changed
- The `showif()` and `showifdef()` functions can now be configured to
  return a default value other than the empty string.
### Fixed
- Cron jobs and environment variables.  This requires a system reset.

## [0.2.35] - 2018-03-06
### Changed
- Replaced Package Management with the former "Update a Package."
### Fixed
- Issues with unicode.

## [0.2.34] - 2018-03-06
### Added
- The `main page pre`, `main page submit`, and `main page post`
  configuration directives.
- The `pre`, `submit`, and `post` metadata items.
### Changed
- Pressing enter has effect of pressing Continue, even on pages
  without input elements.
### Fixed
- Issues with unicode.

## [0.2.33] - 2018-03-04
### Fixed
- Problem with using Upgrade button.

## [0.2.32] - 2018-03-04
### Added
- The `ldap login` configuration directive.  Using this feature will
  require a system upgrade (running a new instance), as the
  `libsasl2-dev` `libldap2-dev` Debian packages are required
  dependencies of the `python-ldap` Python module.

## [0.2.31] - 2018-03-02
### Added
- Configuration directives `use font awesome` and `default icons`.
- CSS support for Material Icons.
- The `question help button` feature.
- Ability to `label` the help tab.
### Fixed
- Reference to non-existent image file during image preloading.
- Error when reviving SMS session for which answers had been deleted.
- SMS interface bugs related to signatures and attachments.

## [0.2.30] - 2018-02-27
### Changed
- SVG instead of PNG for images in checkboxes and radio buttons.
### Fixed
- Page layout when side navigation bar in use.
- Slow submit time when many checkboxes are used.

## [0.2.29] - 2018-02-25
### Added
- The `define()` function.
- The features `question back button` and `navigation back button`.
- The `raw global css` and `raw global javascript` configuration
  directives.
### Changed
- Main content block for page is now centered on desktop.
### Fixed
- Problem with calling background action from code triggered by the API.
- Problem with including a table while gathering the rows of the table.

## [0.2.28] - 2018-02-08
### Added
- The `enable remember me` configuration directive.
### Changed
- The `repr()` of a `DAList`, `DADict`, or `DASet` is the `repr()` of
  its elements, and `repr()` triggers the gathering process.
- The `.salutation()` method of the `Individual` object now uses the
  optional attributes `.salutation_to_use` and `.is_doctor`.
### Fixed
- Problem with `exclude` on a manual list of choices.
- Lack of curly quote in "I don't know" buttons.
- JavaScript error introduced in 0.2.23 that interfered with `hide if`
  functionality.

## [0.2.27] - 2018-01-31
### Added
- The `start_time()` function.
- The `package protection` configuration option.
### Changed
- The `last_access_time()` now returns the last access time as a
  datetime object with a time zone; previously the object was "naive"
  with respect to time zone.
### Fixed
- Problem with branch name of new GitHub repository.
- Problem with `as_datetime()` converting times to midnight when the
  argument is already a datetime object.
- Problem with `noyes` and `noyeswide` checkbox fields.

## [0.2.26] - 2018-01-29
### Fixed
- Problem where `format_date()` was acting like `format_datetime()`.

## [0.2.25] - 2018-01-29
### Changed
- Tweaks to the `interview_url()` function.
### Fixed
- Unicode error on interview page after interview decryption failure.
- Problem with list gathering and `.there_is_another`.

## [0.2.24] - 2018-01-28
### Fixed
- Problem with missing uid in background tasks.

## [0.2.23] - 2018-01-28
### Added
- The `DADateTime` class.
- The `time` and `datetime` `datatype`s for fields.
- The `format_datetime()` function.
- The `/api/session/back` API and the `go_back_in_session()` function.
- The `/api/privileges` and `/api/user/<user_id>/privileges` APIs, and
  the `manage_privileges()` function.
- The `.as_serializable()` method of the `DAObject`.
### Changed
- The `/api/session` POST API now returns the current question, unless the
  `question` data value is set to `0`.
- The `/api/session` POST API now accepts file uploads.
- Changed the name "roles" to the name "privileges" in the
  user-related APIs.
- The `set_user_info()` function can now be used to change user
  privileges.
- Fields with `datatype: date` will now set a variable of type
  `DADateTime`, rather than a plain text variable.
- The `today()` now returns a `DADateTime` object if it is called
  without a `format` parameter.
- The JavaScript for the `show if` and `hide if` functionality now
  animates the showing and hiding of fields.

## [0.2.22] - 2018-01-23
### Added
- Configuration directive `allow demo` for allowing demonstration
  interviews in production mode.
- Ability to send e-mail using the Mailgun API instead of SMTP.
- The `decimal places` option for automatically formatting floating
  point numbers passed to DOCX and PDF forms using `field code`,
  `code`, or `field variables`.
### Changed
- If the `checkin interval` configuration directive is set to `0`, the
  browser will not "check in" at all.
- When the `/api/session/question` API encounters an undefined
  variable for which a definition is not available, it will no longer
  return an error code, but will return a success code and indicate
  what variable was not defined.
### Fixed
- Invalid HTML in navigation bar.
- Removed unnecessary invalidation of interview cache.
- Problem with address autocomplete when variable name contains a bracket.

## [0.2.21] - 2018-01-19
### Added
- The `get_chat_log()` function.
- An API interface.
- Administrative functions.
### Fixed
- Result of `user_interviews()` was reporting the wrong `utc_modtime`.
- Error with `google maps api key` when an `api key` alone was set under
  `google` in the Configuration.
- Problem with formatting of chat log after going back into a session.

## [0.2.20] - 2018-01-14
### Added
- The `send_fax()` function for sending faxes using Twilio.
- The `include_docx_template()` function for including .docx content
  within a .docx file.

## [0.2.19] - 2018-01-12
### Added
- Ability to run `interview_list()` on all users.  Additional keys
  `user_id` and `email` are included in results.
- Integrated the Place Autocomplete feature from the Google Places API.
### Fixed
- Bug in YAML parser triggered sometimes by fields with blank labels.
- Newline to space error in docx templates that affected Word but not LibreOffice.

## [0.2.18] - 2018-01-06
### Added
- The `user` and `environment` datatypes.
### Fixed
- Typo in HTML when `camera` and other HTML5 upload datatypes were used.

## [0.2.17] - 2018-01-04
### Changed
- Better features in background actions for handling exceptions.
### Added
- The `background_error_action()` function.

## [0.2.16] - 2018-01-01
### Fixed
- Problems with cron jobs, including an error in the documentation;
  the variable is not `use_cron`, but `allow_cron`.

## [0.2.15] - 2018-01-01
### Changed
- When filling a PDF form, the Document JavaScripts and Field
  Calculation Order of the template file will be reproduced in the
  resulting PDF file.
- When concatenating PDF files, the Document JavaScripts and Field
  Calculation Order of the first file will be reproduced in the
  resulting PDF file.
### Fixed
- Problem with using specific person as sender of an e-mail.

## [0.2.14] - 2017-12-27
### Added
- Customizable 404 error message.
- The `any_true()` and `all_true()` methods for the `DADict` object.
### Fixed
- Typo in password complexity error message.

## [0.2.13] - 2017-12-24
### Added
- Ability to change the `password complexity` requirements in the 
  Configuration.
- Ability to control whether registering users must retype their 
  passwords.

## [0.2.12] - 2017-12-24
### Fixed
- The `for` attributes of `<label>` elements were mislabeled when a
  field with `show if` defined the same variable.

## [0.2.11] - 2017-12-18
### Fixed
- Problem with validating fields inside `show if`.

## [0.2.10] - 2017-12-15
### Fixed
- Problem recognizing string indices in code.

## [0.2.9] - 2017-12-15
### Fixed
- Problem with dictionaries inside of dictionaries.
- Some of the administrative page customizations did not work.

## [0.2.8] - 2017-12-14
### Fixed
- Inserting images into PDFs using `field code`.

## [0.2.7] - 2017-12-13
### Added
- Configuration directives for inserting HTML, CSS, and JavaScript
  into administrative pages.

## [0.2.6] - 2017-12-12
### Fixed
- GitHub pagination problem with `links_from_header`.

## [0.2.5] - 2017-12-12
### Changed
- The `global css` and `global javascript` now apply to all pages on
  the site.
- Curly quote conversion is re-enabled.
### Added
- Password protection on generated PDF files.
### Fixed
- Documents with `variable name`s containing generic object or
  iterator references can now be used with `attachment code`
- Error when uploading Zip file to Playground packages folder.
- Problem setting boolean character of yesno variables that are
  specified using brackets.
- Problem with referring to `get_url_from_file_reference()` outside of 
  request context.

## [0.2.4] - 2017-12-06
### Changed
- Automatically remove newlines from e-mail subject lines
- PDF thumbnails now have the filename as the "title."
- Background tasks no longer try to process responses if exception
  triggered.
### Added
- Ability to set `exit link` and `exit label` in metadata and
  `set_title()`.
### Fixed
- Error when pulling "master" branches of GitHub packages into the
  Playground.
- Flash message showing when interview YAML file changes and "allow
  login" is False.

## [0.2.3] - 2017-12-04
### Changed
- Turned off automatic curly quote conversion until Unicode error
  in textstat can be fixed.

## [0.2.2] - 2017-12-04
### Added
- Pulling and pushing using GitHub branches.
- The `.failed()` method on result of background task.

## [0.2.1] - 2017-11-30
### Changed
- The hard-coded limit on JSON nesting depth, which was mentioned 
  in the 0.2.0 changes, has been changed from 6 to 20.
### Fixed
- Apache could not start unless Docker container started with a 
  `DAHOSTNAME`.
- GitHub push using GitHub integration failed because of an SSH 
  issue.

## [0.2.0] - 2017-11-29
### Added
- The `logo` option of `set_title()` and `metadata`.
### Changed
- The `all_variables()` and `variables_as_json()` functions now
  contain a limitation on nesting depth.  The limit is hard-coded at 
  6 levels, after which values will be "null."  This is to prevent
  exceptions being triggered by circular references.
- Setting Google Drive Synchronization folder to "Do not link" will
  now erase the connection between the OAuth app and the user.
- When populating PDF checkboxes, passing `None` to the checkbox or to
  the `yesno()` or `noyes()` functions will result in the box not
  being checked.
- Apache web server variables are now reset after a restart (e.g.,
  after the Configuration is changed.
- When pulling the contents of a **docassemble** extension package
  into the Playground, it will now remember the GitHub URL or PyPI
  package name so that when you go to Pull again, you will not need to
  retype.  This works even if you have not enabled GitHub integration.
### Fixed
- PDF checkbox inconsistencies.
- Git pull into Playground packages without integration generated an
  error message.
- When datatype is object and variable existed, it would try to reduce
  the object to text in order to see if it should be highlighted as a
  pre-selected default value.

## [0.1.99] - 2017-11-23
### Added
- Option for changing the UID and GID of www-data within the Docker
  container, so that `/usr/share/docassemble/files` can be mounted as
  a Docker volume and the Playground files can be edited.
### Changed
- Multiple choice questions in `fields` will set boolean `True` or
  `False` if those are the only options.
- Additional headers are set to enable cross-site resource sharing 
  if the CROSSSITEDOMAIN variable is set.
- Apache configuration files in Docker are configured differently;
  existing site configuration files will not be overwritten and 
  configuration options are now implemented as Apache variables.
- `DAList` objects now work with the `+` operator; a regular list can
  be added to a `DAList` but not the other way around.
### Fixed
- The `uncheck others` feature triggered an error if it was not the
  last field.

## [0.1.98] - 2017-11-20
### Changed
- Going to "/exit" will now log out the user, if the user is logged
  in.
- When using `&json=1` for JSON responses, the `interface()` function
  will return `'json'`.
### Added
- Action for `logout`, which works like `exit` but also logs the user out.
### Fixed
- Default values in object choices.

## [0.1.97] - 2017-11-14
### Fixed
- JavaScript issue with buttons.
- Problem with Playground interviews not being decrypted.

## [0.1.96] - 2017-11-12
### Fixed
- JSON conversion problem when using `/interviews?json=1`.

## [0.1.95] - 2017-11-12
### Fixed
- Bug in 0.1.94 regarding detection of variable names.

## [0.1.94] - 2017-11-12
### Fixed
- Improved detection of variable names in code.

## [0.1.93] - 2017-11-10
### Changed
- The `Individual` class no longer initializes the `child`, `income`,
  `asset`, and `expense` attributes, but there are `objects` blocks in
  basic-questions.yml that will initialize these attributes.
- The `Organization` class no longer initializes the `office`
  attribute, unless `offices` is provided as a keyword parameter
  during object construction.
### Added
- Interview tags system and the `session_tags()` function.

## [0.1.92] - 2017-11-09
### Added
- The `checkbox export value` option when using `pdf template file`.
### Changed
- The Markdown to HTML converter now uses the Attribute Lists extension.
- The `server_capabilities()` function now has a `google_maps` item.
- When the server is not in `debug` mode, users must be logged in as
  with administrator or developer privileges to run interviews in
  `docassemble.base` and `docassemble.demo`.  In the SMS interface,
  interviews in these packages are always inoperable unless the server
  is in `debug` mode.
### Fixed
- The `server_capabilities()` was not recognizing the `enable`
  settings.

## [0.1.91] - 2017-11-07
### Changed
- Exceptions triggered during code block execution will now show the
  line, not just indicate the line number.
- The `server_capabilities()` function is now imported by default and
  it reports additional features.
- The `interview_list()` function now returns interview metadata.
### Added
- Dynamically-generated `fields` items.
- The `cross site domain` configuration directive and
  `CROSSSITEDOMAIN` environment variable, for enabling APIs to be
  used.
### Fixed
- Azure blob storage fixes.

## [0.1.90] - 2017-11-05
### Changed
- New features in the `Address.geolocate()` method.
### Added
- The `Address.normalize()` method.
- The `session list interview` and `dispatch interview` configuration
  directives.

## [0.1.89] - 2017-11-04
### Added
- Ability to use `json=1` with `/user/sign-in`, `/list`, and
  `/interviews` pages.
- `interview_list()` and `interview_menu()` functions.
- Twitter login.
### Fixed
- Thread unsafe language setting.

## [0.1.88] - 2017-11-02
### Fixed
- `object_name()` raised an exception.
- Including MP4 videos did not work when OGG not provided.

## [0.1.87] - 2017-11-02
### Fixed
- `docx template file` combined with `code` resulted in error
  due to recent change that attempted to provide better error
  messages.

## [0.1.86] - 2017-11-01
### Added
- `decoration size`, `decoration units`, `button icon size`, 
  `button icon units`, and `button size` configuration options.
- `encode_name()` and `decode_name()`.
### Changed
- Clicking the back button when looking at question help will return
  the user to the question.
### Fixed
- Width of images in .docx files.

## [0.1.85] - 2017-10-29
### Added
- Option for `google maps api key` in the `google` section of the 
  configuration.
### Changed
- A Google API key is now required for using `map_of()`.

## [0.1.84] - 2017-10-29
### Fixed
- UI issues when switching between help and questions tabs.
- Added `pop()` method to `DAList`.
- Machine learning errors when entries are blank.

## [0.1.83] - 2017-10-26
### Added
- The `log()` function.
- The `fields` option for `background_response()`.
### Changed
- Responses from `check in` events can use the `javascript` option of
  `background_response()` to communicate results to the browser.

## [0.1.82] - 2017-10-26
### Added
- The `pdf_concatenate()` function converts word processing files.
- The `flash()` JavaScript function.
### Changed
- When using `complete_attribute`, list gathering will not
  first seek a textual representation of the object.
### Fixed
- Inclusion of images in RTF when a width not specified.
- `value()`, `defined()`, and `undefine()` no longer raise exceptions
  when passed constants or internal Python names.
- Errors in list gathering.

## [0.1.81] - 2017-10-25
### Changed
- Google Drive synchronization is now handled as a background task so
  that it will not be interrupted by a web browser timeout.
### Fixed
- Uploads embedded in docx template files.

## [0.1.80] - 2017-10-23
### Added
- The `set_title()` function.
### Changed
- Interview title functionality in the `metadata` initial block.
### Fixed
- Image URLs to PDF page images with S3/Azure Blob Storage.

## [0.1.79] - 2017-10-23
### Fixed
- PDF page retrieval index error.
- File permissions issue in S3 that prevents server restart.  S3 users 
  must upgrade the Docker image.
- Incorrect timestamps when downloading from persistent cloud storage.

## [0.1.78] - 2017-10-22
### Changed
- When using S3 or Azure Blob Storage, the files will now be cached
  on the server file system and updated when they change.
- When using the Playground and S3 or Azure Blob Storage is in use,
  and there are more than ten decorations, no preview images will be
  shown in "Variables, etc."
- The values of `SavedFile` objects will be cached in memory for the
  duration of a web request, so that when you create a new
  `SavedFile`, attributes will be set from memory.
- The first argument to a `MachineLearner` object will no longer be
  used as a literal `group_id`.  Rather, an argument `'fruit'` it will
  be converted into a group_id of the form
  `docassemble.packagename:data/sources/ml-interviewname.json:fruit`.
  You can still set a literal `group_id` using the keyword parameter 
  `group_id`.
- When an `initial_file` is given to a `MachineLearner` object, two
  different formats can be used: an array, or a dictionary of arrays.
  If a dictionary of arrays, the keys will be checked and if the key
  matches the `group_id` (with the part before the final
  colon, if any, removed), the array corresponding to that key will be
  used.
### Fixed
- Playground wizard not including pdf and docx template files in package.
- Playground wizard not including static files in package.
- Playground wizard pickle error when using S3 or Azure blob storage.
- Bug where key 'sought' not found.

## [0.1.77] - 2017-10-20
### Added
- The `pdf_concatenate()` function.
### Fixed
- Missing dependencies for `RandomForestMachineLearner`.

## [0.1.76] - 2017-10-20
### Added
- `RandomForestMachineLearner` for machine learning with numeric and
  categorical values.
- Context for `SyntaxError`s.
### Fixed
- `code` to specify fields in docx template.
- S3 problems.

## [0.1.75] - 2017-10-18
### Added
- `inline width` field modifier for embedded fields.
- `DAStaticFile` object.
- `set_data()` and `get_data()` methods for `DARedis`.
### Fixed
- `DAFile` initialize function now handles keyword arguments as 
  advertised.

## [0.1.74] - 2017-10-15
### Added
- `data` block.
### Changed
- Validation errors for embedded fill-in-the-blanks elements now
  appear under the fields.
- Embedded radio buttons and checkboxes now use standard HTML
  input elements.
- Embedded currency fields use standard text to represent the currency
  symbol.

## [0.1.73] - 2017-10-15
### Changed
- Referring to a non-existent DAList item after the list has been
  gathered will now generate an exception.
### Fixed
- Brought back gradients on buttons, which had been removed in 0.1.72.

## [0.1.72] - 2017-10-14
### Added
- `bootstrap theme` and `inverse navbar` features and configuration
  directives.
### Fixed
- CSS and JavaScript files imported through features without a
  specified package now use the package of the features block.
- Logout now deletes cookies.

## [0.1.71] - 2017-10-11
### Changed
- `currency()` now returns `''` on non-numeric input.
### Fixed
- AWS secret access codes with slashes.
- Recognition of iterators with constant integers.

## [0.1.70] - 2017-10-10
### Added
- Method `item()` for `DAList` and `DADict`.
- Lettuce tests in directory `tests`.
### Changed
- Playground variable detection now shows attributes.
- Playground variable detection now adjusts for temporary Mako variables.
- The `split()` function now splits on newlines.
- Playground no longer loads each example interview into memory.
### Fixed
- Template file Google Drive deletion.
- Problem with pickling result of `.using()`.
- Scanning for variable names involving patterns like `[i][j]`.

## [0.1.69] - 2017-10-05
### Added
- Class method `.using()` for adding parameters to object definitions.
### Changed
- Backups only kept now for 14 days.  Container upgrade necessary.
### Fixed
- Use of iterators and generic objects in `if` modifiers.
- Azure cron backup.  Container upgrade necessary.

## [0.1.68] - 2017-10-05
### Added
- `if` modifier.
### Changed
- Interview cache invalidation now handled through thread local
  variables and a redis counter, rather than by modification times on
  YAML files.  This may avoid potential problems with Google Drive
  sync.
- Google Drive sync now has a page that tells the user not to stop the
  web browser.
### Fixed
- Error on URL redirection.
- Playground package page asking for GitHub sign-in after expiration
  of credentials.
- History on error page restored.

## [0.1.67] - 2017-10-02
### Added
- Warnings in the Playground when use of a particular file name would
  overwrite an existing file.
- Functions `yesno`, `split`, `showif`, `showifdef`, and `phone_number_part`.
### Changed
- Fields in a PDF fill-in form can be specified as a list of dictionaries.
### Fixed
- When `maximum image size` in effect, files that got converted to PNG
  by the browser still had original file extensions.
- Typo introduced in 0.1.65 affecting the processing of lists of
  choices in multiple-choice questions.

## [0.1.66] - 2017-10-01
### Fixed
- Problem with empty upload fields.

## [0.1.65] - 2017-09-30
### Changed
- More consistent behavior in multiple choice listings.
- When a multiple choice question's choices are determined by code,
  the image can be an uploaded file.
### Added
- The `if` modifier.
- The `scan for variables` modifier.
- The `dispatch` function.
- The `has_been_gathered()` method on groups.
- More expansive error messages in debug mode.
### Fixed
- Errors if variable names in `question` blocks are invalid.
- Error in `date_difference()`.
- Layout problem when sections and progress meter both turned on.

## [0.1.64] - 2017-09-26
### Fixed
- Gathering of Asset items.

## [0.1.63] - 2017-09-26
### Added
- Example of editing a list after it has been gathered.
### Fixed
- Embedded fields where the variable names contain iterators.
- Lists instanceNames adjusting after removal of a list element.

## [0.1.62] - 2017-09-24
### Changed
- Fields can now be embedded in `note` text.
### Added
- Multiple choice type `combobox` and `datatype: combobox` for
  `fields`.
### Fixed
- Mandatory multiple-choices questions with embedded code blocks.
- `DAList` and `DADict` objects in choices lists.

## [0.1.61] - 2017-09-23
### Changed
- After back button is pressed, defaults will be populated on fields
  that accept defaults.
### Added
- Methods on `DAFileCollection` so that it can be used like a
  `DAFile`.
- `run_python_module()` function.
### Fixed
- Checkbox defaults specified as `DADict` objects not recognized.

## [0.1.60] - 2017-09-21
### Changed
- Added a new type of infinite loop detection.

## [0.1.59] - 2017-09-21
### Changed
- Added a different type of infinite loop detection.

## [0.1.58] - 2017-09-19
### Added
- Multiple choice type `dropdown`.
- Code example for `fields` dropdown.
### Fixed
- YouTube video widths not responsive.
- Javascript and CSS files in features not loading without full
  package/file references.

## [0.1.57] - 2017-09-19
### Fixed
- Bug that affected some file-related operations.
- Detection of infinite loops.

## [0.1.56] - 2017-09-17
### Changed
- The way that the `objects` block gets executed has changed.  It no
  longer executes as a mandatory block unless it is marked as
  mandatory.
- In addition, the way that questions are asked has changed
  accordingly.  If any fields that would be set by the question have
  attributes, **docassemble** will try to ensure that the underlying
  variable is already defined, which may trigger a process of defining
  the variable.  This will ensure that objects mentioned in object
  blocks will be created before they are necessary.
- These new changes enable the use of iterator variables like `i` in
 `objects` blocks.
### Fixed
- Problem with deletion of keys on S3.
- Problem with response() on second and subsequent screens.

## [0.1.55] - 2017-09-16
### Added
- The `id` and `precedence` modifiers and the `order` initial block.
- The JSON interface.

## [0.1.54] - 2017-09-16
### Fixed
- Upgraded from boto to boto3.
- Fixed issues with documents and cloud storage.

## [0.1.53] - 2017-09-15
### Fixed
- Problem with docassemble.base as a dependency in extension packages.

## [0.1.52] - 2017-09-15
### Fixed
- Problem with assembled documents on cloud storage.

## [0.1.51] - 2017-09-14
### Added
- JSON version of information on each screen.
### Fixed
- Problem with signatures in pdf fill documents.

## [0.1.50] - 2017-09-10
### Added
- Options for `maximum image size` to reduce size of uploaded images
  in the browser before uploading.
- Interview feature `cache documents` for disabling document caching.
### Fixed
- E-mailing of assembled documents.

## [0.1.49] - 2017-09-07
### Added
- Additional document caching feature.
### Fixed
- Problem with caching of certain document types.

## [0.1.48] - 2017-09-06
### Added
- Option for `go full screen` that limits behavior to mobile only.
- Caching of assembled documents.  Clicking on assembled documents
  will now open them in a new browser tab rather than offering them
  as attachment downloads.
### Changed
- In Google Drive synchronization, .tmp and .gdoc files are now 
  ignored.
### Fixed
- Spinner did not appear on signature pages.
- Date validation forcing input even when date not required.
- Images included in terms not appearing unless fully qualified.

## [0.1.47] - 2017-09-04
### Added
- Function `referring_url()` for accessing the original "referer" URL.
- Feature `go full screen` for breaking out of iframes.
- Support in Docker for MySQL connections.
### Fixed
- Error accessing machine learning training area.
- Undefined mimetype error with e-mail receiving feature.
- "Next will be" message in SMS interface skipped `note` and `html`.

## [0.1.46] - 2017-09-02
### Added
- Methods `.true_values()` and `.false_values()` for `DADict`.
### Fixed
- Multiple choice questions where list of selections is empty.
- SMS interface for multiple choice questions where list of 
  selections is empty.

## [0.1.45] - 2017-08-31
### Added
- Configuration directive `password login`, which will hide the
  username and password fields on the login screen.
### Fixed
- Better error messages when packages fail to install.
- Better error messages in `worker.log` when background processes
  do not complete.

## [0.1.44] - 2017-08-30
### Changed
- Datatype `object_checkboxes` will now create the variable if it does not
  exist.
### Fixed
- Control mode submitting clicks twice in some circumstances.
- Voice call forwarding.
- Duplicate checkbox validation error message.
- `send_email()` did not e-mail .docx files when given
  DAFileCollection objects.
- Inconsistency in handling of nested questions.

## [0.1.43] - 2017-08-27
### Fixed
- Extraneous call to checkin for chat log.
- Clicking elements in control mode in live chat.
- Problems with db table prefixes.
- Adjusted to changes in flask-user.
- Downgraded to Debian jessie because there was a problem with corrupt
  HTTP responses.

## [0.1.42] - 2017-08-24
### Added
- set_attributes() method for `DAFile` and `DAFileList` in order to
  allow uploaded files to be used across interview sessions and not be
  deleted when the session in which the file was uploaded is deleted.
- url_for() method for `DAFileList`.
### Changed
- Hyperlinks to actions (e.g., created through `url_action()` or
`action_menu_item()`) are now carried out through Ajax.
### Fixed
- Compatibility of UI elements with 'control' live help feature.
- Extraneous "Menu" entry in mobile menu when custom menu used.

## [0.1.41] - 2017-08-23
### Added
- Configuration directive `require referer` that allows users who use
  referer blockers to use **docassemble**.
- `.show()` method for `DATemplate` objects, for interchangability
  with images in `DAFile` objects.
### Fixed
- Error when `valid types` was set to `pdf` when `docx template file`
  was in use.
- Typo in HTML of monitor page.
- Auto-updating of version numbers in package listing.
- Updating of package table so that core packages are retrieved from
  pip, not GitHub.

## [0.1.40] - 2017-08-23
### Changed
- Upgraded from Debian jessie to Debian stretch
### Added
- Ability to specify filenames in `attachment` blocks using `code`.
### Fixed
- Error when GIFs inserted into RTF file.

## [0.1.39] - 2017-08-20
### Added
- Page where administrator can add users manually without going
  through invitation process.
### Fixed
- Non-ASCII characters in PDF field defaults no longer stripped out
  when scanning through utilities.

## [0.1.38] - 2017-08-16
### Fixed
- Bug in Alembic upgrade process

## [0.1.37] - 2017-08-16
### Changed
- Fields with `datatype: checkboxes` now have a "None of the above"
  option by default, and input validation ensures that something is
  checked.  The `none of the above` field modifer configures it.
- After registration, users will bypass the "Interviews" screen and
  go right back to their interview, if they have started an interview.
### Added
- Option in `fields` called `uncheck others` when `datatype` is
  `yesno`, `noyes`, `yesnowide`, or `noyeswide`.  Enables a yes/no
  field to act as a "None of the above" option.
- "Upgrade docassemble" button on the "Update a package" page.
### Fixed
- Automatic login after registration was not working, so users had to
  enter username and password information twice.
- Improved CSS for when name of interview on mobile is too long to fit
  in navigation bar.
- Non-ASCII characters in PDF fields when scanning through utilities
  no longer cause an error.
- Fixed problem introduced in 0.1.22 where interview data would be
  destroyed when switching back to an interview during the same session.

## [0.1.36] - 2017-08-13
### Fixed
- Small typo that made 0.1.35 unusable.

## [0.1.35] - 2017-08-13
### Added
- Support for help text next to choices in a multiple choice list.
### Changed
- Database upgrades now handled by alembic by default.  See the 'use
  alembic' configuration directive.
- Extension packages no longer depend on the docassemble.base or
  docassemble.webapp packages.  As a result, installation of an
  extension package will no longer trigger a total software update.
  If you want to upgrade docassemble, upgrade docassemble.webapp.
  Note that packages created in earlier versions will still have these
  dependencies until they are regenerated in the Playground.  You can
  always edit `install_requires` in the setup.py file.
### Fixed
- Bug fixes to SMS interface.

## [0.1.34] - 2017-08-10
### Fixed
- Checkboxes became `DADict`s a few weeks ago but the auto-gathering
  system on them was not turned off; it is turned off now.

## [0.1.33] - 2017-08-09
### Fixed
- Backwards compatibility for interviews started before `nav` added as
  a variable in the user dictionary.
- Extension packages now depend on `docassemble.webapp` so that when a
  package is updated, all of docassemble is updated, not just
  `docassemble.base`.

## [0.1.32] - 2017-08-08
### Changed
- `force_ask()` can ask a series of questions.
### Added
- Configuration directives for customization of global Javascript and
  CSS.
- Configuration directives for customization of start page and
  interview list.

## [0.1.31] - 2017-08-07
### Changed
- Review page buttons now Ajax.
- Screen reverts to review page after field edit.
### Fixed
- Problem with PDF/A due to old version of pdfx.

## [0.1.30] - 2017-08-07
### Added
- PDF/A support.
- Navigation bar option.
### Fixed
- Problem with files when user logged in.

## [0.1.29] - 2017-08-03
### Added
- Input validation with Python code.
- Input validation for dates, in addition to the limited Javascript validation.

## [0.1.28] - 2017-08-01
### Fixed
- DADict object now defines ask_object_type by default
- Bug with `using` combined with `ml`.

## [0.1.27] - 2017-07-31
### Added
- `ml` and `mlarea` data types and training system.
### Fixed
- Better error message in Playground when interview has a syntax error.
- Problem with temporary files introduced in 0.1.23 that was causing
  PDF fill-in to fail.

## [0.1.26] - 2017-07-25
### Fixed
- Minor git issue again.

## [0.1.25] - 2017-07-24
### Changed
- Back button style.
### Fixed
- labelauty issue.

## [0.1.24] - 2017-07-24
### Fixed
- Minor git issue.

## [0.1.23] - 2017-07-23
### Changed
- Additional deletion of temporary files through cron job.
### Fixed
- Improved performance by optimizing markdown and regex.
- Newer version of labelauty, with modifications to include benefits
  of older version, for compatibility with IE/Edge.

## [0.1.22] - 2017-07-22
### Added
- `read_qr()` function.
- `new_object_type` option for groups.
### Changed
- The default for the `debug` configuration directive is now `True`.
### Fixed
- The `disable others` field modifier can now be used on a field with
  the same variable name as that of another field on the same page.
- Term definition Markdown is now converted to HTML.
- Fixed bug with code blocks using iterators.
- Fixed problem with document attachments affecting data storage and
  multiple application servers.
- Playground run now resets page counter.

## [0.1.21] - 2017-07-14
### Changed
- Checkboxes now create `DADict` objects rather than `dict` objects.
### Added
- `all_true()` and `all_false()` methods for DADict.
### Fixed
- Fixed bug when user invitation e-mail fails to send.
- Error message when code and question blocks are combined.

## [0.1.20] - 2017-07-10
### Fixed
- Fixed another bug in edit user profile page.

## [0.1.19] - 2017-07-10
### Fixed
- Fixed bug in edit user profile page.

## [0.1.18] - 2017-06-28
### Added
- Pull package into Playground with PyPI.
### Changed
- `initial` directive now accepts code, just like `mandatory`.
- Error page now returns 404 instead of 501 when user tries to access
  an interview file that does not exist.
### Fixed
- Added MANIFEST.in so that README.md is included when packages are
  bundled using setup.py.
- Uploading files to Playground now checks to make sure the file is
  YAML and is readable.

## [0.1.17] - 2017-06-24
### Changed
- Updated the required system version to 0.1.17.
### Fixed
- If you updated the Python packages to 0.1.15 or 1.1.16 without
  updating the system, you may have experienced an error.  Now, if
  changes to the Python packages alter the necessary PostgreSQL
  columns or tables, those columns and tables will be changed upon
  reboot after the updating of the Python packages, and will not have
  to wait until an upgrade of the system.
- Fixed reference in Dockerfile to non-existent file.

## [0.1.16] - 2017-06-24
### Added
- GitHub integration.
- `dow_of()` function.
### Changed
- Changed PyPI username and passwords from a configuration setting to
  a user setting.
### Fixed
- More stable transition when transitioning server from non-cloud data
  storate to cloud data storage
- `month_of()` now uses defined language/locale rather than system
  locale when `word_of` is `True`.
- Executables that run as root no longer writable by www-data.
- Turned off auto-start on sync supervisor process.

## [0.1.15] - 2017-06-18
### Added
- SMS option for two-factor authentication.
- Option for requiring confirmation of user e-mail addresses.
### Fixed
- Problem with apt-get update at start of Dockerfile.

## [0.1.14] - 2017-06-17
### Changed
- Renamed configuration directives from "second factor" to "two factor."

## [0.1.13] - 2017-06-17
### Added
- Two-factor authentication.
- Phone login.

## [0.1.12] - 2017-06-06
### Changed
- To facilitate GitHub workflow, attempted to preserve timestamps on
  filenames in Zip files.

## [0.1.11] - 2017-06-04
### Changed
- Increased font size for better mobile experience.

## [0.1.10] - 2017-06-03
### Changed
- Look and feel of signature pages now match regular interface on
  larger screens,

## [0.1.9] - 2017-06-02
### Fixed
- Various bugs from previous version.

## [0.1.8] - 2017-06-01
### Fixed
- Bug with Google Drive integration.

## [0.1.7] - 2017-06-01
### Fixed
- Bug with server-side encryption.

## [0.1.6] - 2017-05-30
### Added
- Google Drive integration.

## [0.1.5] - 2017-05-28
### Fixed
- Bug with logins in the middle of interviews.

## [0.1.4] - 2017-05-27
### Changed
- New algorithm for generic variables and index variables.
### Added
- Additional examples.

## [Unreleased] - 2017-05-26
### Changed
- PDF fill-in files now editable.
- Started using bumpversion.
- Started a changelog.
