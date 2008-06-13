@REM
@REM $Id$
@REM
@rmdir ready-to-deploy /s /q
@REM      sourcedir----------------------------------------------------------------destdir-----------------------------------------[files]-------------------quals---------filter--------
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework                                  ready-to-deploy                                 *.asax                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework                                  ready-to-deploy                                 *.aspx                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework                                  ready-to-deploy                                 *.config                  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework                                  ready-to-deploy                                 *.pdf                     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\bin                              ready-to-deploy\bin                                                       /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\image                            ready-to-deploy\image                                                     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\noninteractive                   ready-to-deploy\noninteractive                  *.crontab                 /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\noninteractive                   ready-to-deploy\noninteractive                  *.aspx                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected                        ready-to-deploy\protected                       *.asax                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected                        ready-to-deploy\protected                       *.aspx                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected                        ready-to-deploy\protected                       *.config                  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\image                  ready-to-deploy\protected\image                                           /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\protected\template\notification  ready-to-deploy\protected\template\notification                           /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\resource                         ready-to-deploy\resource                                                  /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\template\notification                     ready-to-deploy\template\notification                                     /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\usercontrol\app                  ready-to-deploy\usercontrol\app                 *.ascx                    /m /np /ns /z | qgrep "New "
@robocopy C:\Inetpub\wwwroot\KiAspdotnetFramework\usercontrol\ki                   ready-to-deploy\usercontrol\ki                  *.ascx                    /A /np /ns /z | qgrep "New "
@pause