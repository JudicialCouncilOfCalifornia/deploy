# Past

`jhpyle/docassemble` has code for multiple packages, deployment, and testing tools; is quite confusing.

# Present

`JudicialCouncilOfCalifornia/docassemble.deploy` uses Travis CI, AWS, and Terraform to simplify the deployment and test process for Docassemble.

`JudicialCouncilOfCalifornia/docassemble.deploy` does not include the core docassemble python packages, and installs the latest versions from pypi.

# Future

I think the core docassemble repository should be broken apart into component parts and moved to a new org account (named Docassemble):

1. `jhpyle/docassemble:docassemble` -> `Docassemble/namespace`
2. `jhpyle/docassemble:docassemble_base` -> `Docassemble/base`
3. `jhpyle/docassemble:docassemble_demo` -> `Docassemble/demo`
4. `jhpyle/docassemble:docassemble_webapp` -> `Docassemble/webapp`
5. `jhpyle/docassemble:<EVERYTHING ELSE>` -> `Docassemble/deploy`

# TL;DR

`JudicialCouncilOfCalifornia/docassemble.deploy` is intended as an open source version of Docassemble Toolkit.
