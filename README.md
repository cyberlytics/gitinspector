[![License](https://img.shields.io/github/license/cyberlytics/gitinspector.svg?style=flat-square)](https://github.com/cyberlytics/gitinspector/blob/master/LICENSE.txt)

<h2>
 <img align="left" height="65px"
      src="https://raw.githubusercontent.com/cyberlytics/gitinspector/master/gitinspector/html/gitinspector_piclet.png"/>
      &nbsp;About Gitinspector
</h2>
<img align="right" width="30%" src="https://raw.github.com/wiki/ejwa/gitinspector/images/html_example.jpg" /> 
Gitinspector is a statistical analysis tool for git repositories. The default analysis shows general statistics per author, which can be complemented with a timeline analysis that shows the workload and activity of each author. Under normal operation, it filters the results to only show statistics about a number of given extensions and by default only includes source files in the statistical analysis.

This tool was originally written to help fetch repository statistics from student projects in the course Object-oriented Programming Project (TDA367/DIT211) at Chalmers University of Technology and Gothenburg University.

Today, gitinspector is used as a grading aid by universities worldwide.

A full [Documentation](https://github.com/ejwa/gitinspector/wiki/Documentation) of the usage and available options of gitinspector is available on the wiki. For help on the most common questions, please refer to the [FAQ](https://github.com/ejwa/gitinspector/wiki/FAQ) document.

### Version/Fork Disclaimer
This is an improved version of the original **gitinspector** by ejwa.
And it has been forked from jpwhite3. In combination this version provides:

    * Migration of gitinspector from python2 to python3 (from jpwhite3)
	* Containerization / Dockerfile (by cyberlytics)

Consider it a **version 0.5.0dev** of gitinspector.\
No git releases intended, but only docker releases.

The docker workdir is set to container-internal \/repo directory and the entrypoint is set to run gitinspector.
Also, gitinspector by default executes on the current directory.
In combination, you only need to mount your host git directory to \/repo and it justs works.
You can provide any [gitinspector parameters](https://github.com/ejwa/gitinspector/wiki/Documentation) to the docker container directly.

Cross-platform (Windows/Linux) for a git repo in current directory, using pwsh for unification:
```
pwsh.exe -command "docker run --rm -it -v ${PWD}/:/repo --rm cyberlytics/gitinspector:0.5.0dev"
```

Simpler Windows CMD variation:
```
docker run --rm -it -v %CD%:/repo --rm cyberlytics/gitinspector:0.5.0dev
```

More complete Windows example with providing gitinspector file type star ('\*') for extension-less files like Dockerfile:\
(The escape of the \* character depends on the plattform (win/lin) reps. the shell (cmd, pwsh, sh/bash,...).)
```
docker run --rm -v "%CD%":/repo cyberlytics/gitinspector:0.5.0dev --format=html -lmrTw -L --file-types=js,jsx,cjs,mjs,svelte,ts,tsx,vue,^*,md
```

### Some of the features
  * Shows cumulative work by each author in the history.
  * Filters results by extension (default: java,c,cc,cpp,h,hh,hpp,py,glsl,rb,js,sql).
  * Can display a statistical timeline analysis.
  * Scans for all filetypes (by extension) found in the repository.
  * Multi-threaded; uses multiple instances of git to speed up analysis when possible.
  * Supports HTML, JSON, XML and plain text output (console).
  * Can report violations of different code metrics.

### The cyberlytics Team (2024-today)
  * Christoph P. Neumann, patch coordinator and docker maintainer

### The original ejwa Team (2012-2015)
  * Adam Waldenberg, Lead maintainer and Swedish translation
  * Agustín Cañas, Spanish translation
  * Bart van Andel, npm package maintainer
  * Bill Wang, Chinese translation
  * Christian Kastner, Debian package maintainer
  * Jiwon Kim, Korean translation
  * Kamila Chyla, Polish translation
  * Luca Motta, Italian translation
  * Philipp Nowak, German translation
  * Sergei Lomakov, Russian translation
  * Yannick Moy, French translation

### License
gitinspector is licensed under the *GNU GPL v3*. The gitinspector logo is partly based on the git logo; based on the work of Jason Long. The logo is licensed under the *Creative Commons Attribution 3.0 Unported License*.