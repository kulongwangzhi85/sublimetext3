# sublimetext3 + virtualenv + sublimerepl
默认情况下SublimeREPL使用操作系统下的python解释器。并非我们在Sublime Text3中激活的Python环境。
在此记录SublimeREPL的配置。
**该方法采用获取项目名称和项目配置文件中的'virtualenv‘ key,相比其它方案灵活。**<br>
**说明：操作系统manjaro Linux 18**

## 前提条件：
>		1:安装有virtualenv插件
>		2:必须,必须，必须,使用项目方式管理(project)
>		3:操作系统必须安装jq(json解释工具)

## 演示:
![效果](sublimerepl.gif)
>这里使用了不同层级目录下的pytho文件。(project)/example.py和(project)/b/example.py做演示

## 配置:
>		打开sublimerepl配置目录(sublime-text-3/Packages/SublimeREPL/config/Python/)
<br>
>		编辑Main.sublime-menu。修改其中id为：repl_python_run下的cmd，将内容修改为：cmd: [${packages}/SublimeREPL/config/Python/pyvenv.sh", "$project_path", "$project_name", "$file_basename"]
**参数说明：**
`pyvenv.sh`脚本:	自己创建的脚本，并符执行权，脚本内容见下文
<br>
`project_path`变量:	项目路径
<br>
`project_name`变量:	项目名称
<br>
`file_basename`变量:	需要被执行的程序文件

>		注意:默认情况下，sublimeREPL不会传递project_path，project_name变量。需配置"use_build_system_hack": true

**Main.sublime-menu:**
<br>
![Main.sublime-menu](Main.sublime-menu.png)
<br>
**用户sublimeREPL配置:**
<br>
![sublimerepl-usersetting.png](sublimerepl-usersetting.png)
<br>
**pyvenv.sh脚本:**
<br>
![pyvenv.sh](pyvenv.png)
<br>
**激活前的项目配置文件:**
<br>
![deactivate](deactivate.png)
<br>
**激活后的项目配置文件:**
<br>
![activate](activate.png)

## 思路:
就是将项目配置文件路径传递到sublimeREPL，利用bash脚本的jq解析出virtualenv的值

## 写在最后
由于对sublime text3和python不剩了解。有任何问题欢迎指点。谢谢
