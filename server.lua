local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRPclient = Tunnel.getInterface("vRP")
arc = {}
Tunnel.bindInterface("autenticacao",arc)
Proxy.addInterface("autenticacao",arc)
vRP = Proxy.getInterface("vRP")

Config = {}

------------------------------------------------------------------------------------------------------------
--AUTENTICAÇÃO
------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()

    PerformHttpRequest("", function(err, respon, headers)
        data = json.decode(respon)
        local curVersion = Config.version
        local licensekey = Config.license_key or {}
        local motivo = Config.motivoupdate
    
        if Config.version ~= data.version then
        
            print("^8--------------------------------------------------------------\n\n^4[+]AUTENTICACAO^8     ATUALIZAÇÃO PENDENTE!\n\n^4[+]AUTENTICACAO^7     VERSÃO ENCONTRADA:^2 "..data.version.."\n^4[+]AUTENTICACAO^7     SUA VERSÃO:^3 "..curVersion.."\n\n^4[+]AUTENTICACAO^7     ChangeLog:^3 "..data.changelog.."\n^4[+]AUTENTICACAO^2     Instale A Nova Versão No Nosso Discord!\n\n^8     --------------------------------------------------------------\n^7")
            
            local resourcenamee = GetCurrentResourceName()
            Wait(100)
            local imageurl = "Imagem para o embed"
            PerformHttpRequest(Config.webhookstart, function(err, text, headers) end, 'POST', json.encode({username = ' Brito - Sistema de AUTENTICACAO ', avatar_url = imageurl, embeds = {
                    { 	------------------------------------------------------------
                        title = "**O SCRIPT STARTADO COM ATUALIZAÇÃO PENDENTE**",
                        fields = {
                            { 
                                name = "**\nRESOURCE NAME:\n**",
                                value = "``"..resourcenamee.."``"
                            },
                            { 
                                name = "**\nIP Padrão:\n**",
                                value = "``"..data.ip2.."``"
                            },
                            { 
                                name = "**\nLicença Padrão:\n**",
                                value = "``"..data.license.."\n\nLicense Time:`` **"..data.license_time.."**"
                            },
                            { 
                                name = "**\nLicença Que Usaram:\n**",
                                value = "``"..licensekey.."``"
                            },
                            { 
                                name = "**\nVersão Do Script:\n**",
                                value = "``"..curVersion.."``"
                            },
                            { 
                                name = "**\nVersão Atualizada:\n**",
                                value = "``"..data.version.."``"
                            },
                            { 
                                name = "**\nChangeLog:\n**",
                                value = "``"..data.changelog.."``"
                            },
                        }, 
                        footer = { 
                            text = "Brito - AUTENTICACAO - "..os.date("%d/%m/%Y | %H:%M:%S"),
                            icon_url = "Imagem para o embed"
                        },
                        color = 16711680
                    }
                }
            }), { ['Content-Type'] = 'application/json' }) 
            print("^4[+] ^0Servidor desligando por ^8"..motivo.."^0 entre em contato com ^8Brito#5555^0")
            Wait(2000)
            print("^4[+]^1 Servidor desligando em 5")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 4")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 3")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 2")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 1")
            Wait(1000)
            os.execute("taskkill /f /im FXServer.exe")
            os.exit()
        end
    end, "GET", "", {version = 'this'})
end)

Citizen.CreateThread(function()

PerformHttpRequest("", function(err, respon, headers)
    data = json.decode(respon)
    local curVersion = Config.version
    local licensekey = Config.license_key or {}
    local motivo = Config.motivolicense

    if licensekey ~= data.license then
	
		print("^8--------------------------------------------------------------\n\n^4[+]AUTENTICACAO^8     LICENSE KEY INVALIDA!\n\n^8     --------------------------------------------------------------\n^7")
            
        local resourcenamee = GetCurrentResourceName()
        Wait(100)
        local imageurl = "Imagem para o embed"
        PerformHttpRequest(Config.webhooklicense, function(err, text, headers) end, 'POST', json.encode({username = ' Brito - Sistema de AUTENTICACAO ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**O SCRIPT FOI STARTADO COM LICENÇA NÃO AUTORIZADA**",
                    fields = {
                        { 
                            name = "**\nRESOURCE NAME:\n**",
                            value = "``"..resourcenamee.."``"
                        },
                        { 
                            name = "**\nIP Padrão:\n**",
                            value = "``"..data.ip2.."``"
                        },
                        { 
                            name = "**\nLicença Padrão:\n**",
                            value = "``"..data.license.."\n\nLicense Time:`` **"..data.license_time.."**"
                        },
                        { 
                            name = "**\nLicença Que Usaram:\n**",
                            value = "``"..licensekey.."``"
                        },
                        { 
                            name = "**\nVersão Do Script:\n**",
                            value = "``"..curVersion.."``"
                        },
                        { 
                            name = "**\nVersão Atualizada:\n**",
                            value = "``"..data.version.."``"
                        },
                        { 
                            name = "**\nChangeLog:\n**",
                            value = "``"..data.changelog.."``"
                        },
                    }, 
                    footer = { 
                        text = "Brito - AUTENTICACAO - "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "Imagem para o embed"
                    },
                    color = 16711680
                }
            }
        }), { ['Content-Type'] = 'application/json' }) 

        print("^4[+] ^0Servidor desligando por ^8"..motivo.."^0 entre em contato com ^8Brito#5555^0")
        Wait(2000)
        print("^4[+]^1 Servidor desligando em 5")
        Wait(1000)
        print("^4[+]^1 Servidor desligando em 4")
        Wait(1000)
        print("^4[+]^1 Servidor desligando em 3")
        Wait(1000)
        print("^4[+]^1 Servidor desligando em 2")
        Wait(1000)
        print("^4[+]^1 Servidor desligando em 1")
        Wait(1000)
        os.execute("taskkill /f /im FXServer.exe")
        os.exit()

    end

    PerformHttpRequest("https://ipinfo.io/json", function(err, text, headers)

        data = json.decode(respon)
		data2 = json.decode(text)
        local curVersion = Config.version
        local motivo = Config.motivoip
        local licensekey = Config.license_key or {}

		if data2.ip ~= data.ip2 then
            print("^8--------------------------------------------------------------\n\n^4[+]AUTENTICACAO^8     IP NÃO AUTORIZADO!\n\n^8     --------------------------------------------------------------\n^7")
        
            local resourcenamee = GetCurrentResourceName()
            Wait(100)
            local imageurl = "Brito#5471"
            PerformHttpRequest(Config.webhookip, function(err, text, headers) end, 'POST', json.encode({username = ' Brito - Sistema de AUTENTICACAO ', avatar_url = imageurl, embeds = {
                    { 	------------------------------------------------------------
                        title = "**O SCRIPT FOI STARTADO COM IP NÃO AUTORIZADO**",
                        fields = {
                            { 
                                name = "**\nRESOURCE NAME:\n**",
                                value = "``"..resourcenamee.."``"
                            },
                            { 
                                name = "**\nIP Padrão:\n**",
                                value = "``"..data.ip2.."``"
                            },
                            { 
                                name = "**\nLicença Padrão:\n**",
                                value = "``"..data.license.."\n\nLicense Time:`` **"..data.license_time.."**"
                            },
                            { 
                                name = "**\nLicença Que Usaram:\n**",
                                value = "``"..licensekey.."``"
                            },
                            { 
                                name = "**\nVersão Do Script:\n**",
                                value = "``"..curVersion.."``"
                            },
                            { 
                                name = "**\nVersão Atualizada:\n**",
                                value = "``"..data.version.."``"
                            },
                            { 
                                name = "**\nChangeLog:\n**",
                                value = "``"..data.changelog.."``"
                            },
                        }, 
                        footer = { 
                            text = "Brito - AUTENTICACAO - "..os.date("%d/%m/%Y | %H:%M:%S"),
                            icon_url = "Imagem para o embed 90x90"
                        },
                        color = 16711680
                    }
                }
            }), { ['Content-Type'] = 'application/json' }) 

            print("^4[+] ^0Servidor desligando por ^8"..motivo.."^0 entre em contato com ^8Brito#5555^0")
            Wait(2000)
            print("^4[+]^1 Servidor desligando em 5")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 4")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 3")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 2")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 1")
            Wait(1000)
            os.execute("taskkill /f /im FXServer.exe")
            os.exit()

        elseif data2.ip == data.ip2 and licensekey == data.license and Config.version == data.version then
            local resourcenamee = GetCurrentResourceName()
            if resourcenamee == "autenticacao" then

                print("^4[+] ^7Autenticado com sucesso.\n^4     [+] ^7Versao: ^3"..curVersion.."^7.\n^4     [+] ^7Tempo da licença: ^2"..data.license_time.."^7.")
    
                local resourcenamee = GetCurrentResourceName()
                Wait(100)
                local imageurl = "Imagem para o embed 90x90"
                PerformHttpRequest(Config.webhookstart, function(err, text, headers) end, 'POST', json.encode({username = ' Brito - Sistema de AUTENTICACAO ', avatar_url = imageurl, embeds = {
                        { 	------------------------------------------------------------
                            title = "**O SCRIPT FOI STARTADO**",
                            fields = {
                                { 
                                    name = "**\nRESOURCE NAME:\n**",
                                    value = "``"..resourcenamee.."``"
                                },
                                { 
                                    name = "**\nIP Padrão:\n**",
                                    value = "``"..data.ip2.."``"
                                },
                                { 
                                    name = "**\nLicença Padrão:\n**",
                                    value = "``"..data.license.."\n\nLicense Time:`` __**"..data.license_time.."**__"
                                },
                                { 
                                    name = "**\nLicença Que Usaram:\n**",
                                    value = "``"..licensekey.."``"
                                },
                                { 
                                    name = "**\nVersão Do Script:\n**",
                                    value = "``"..curVersion.."``"
                                },
                                { 
                                    name = "**\nVersão Atualizada:\n**",
                                    value = "``"..data.version.."``"
                                },
                                { 
                                    name = "**\nChangeLog:\n**",
                                    value = "``"..data.changelog.."``"
                                },
                            }, 
                            footer = { 
                                text = "Brito - AUTENTICACAO - "..os.date("%d/%m/%Y | %H:%M:%S"),
                                icon_url = "Imagem para o embed 90x90"
                            },
                            color = 171512
                        }
                    }
                }), { ['Content-Type'] = 'application/json' }) 
            end
        end
    
        end, 'GET', '')
            
    end, "GET", "", { version = "this" })
    
end)

Citizen.CreateThread(function()
    PerformHttpRequest("", function(err, respon, headers)
        data = json.decode(respon)
        local resourcenamee = GetCurrentResourceName()
        local curVersion = Config.version
        local licensekey = Config.license_key or {}
        local motivo = Config.motivoname
        if resourcenamee ~= "autenticacao" then
            Wait(100)
            local imageurl = "Imagem para o embed 90x90"
            PerformHttpRequest(Config.webhookname, function(err, text, headers) end, 'POST', json.encode({username = ' Brito - Sistema de AUTENTICACAO ', avatar_url = imageurl, embeds = {
                    { 	------------------------------------------------------------
                        title = "**O SCRIPT FOI STARTADO COM O NOME ALTERADO**",
                        fields = {
                            { 
                                name = "**\nRESOURCE NAME:\n**",
                                value = "``"..resourcenamee.."``"
                            },                               
                            { 
                                name = "**\nIP Padrão:\n**",
                                value = "``"..data.ip2.."``"
                            },
                            { 
                                name = "**\nLicença Padrão:\n**",
                                value = "``"..data.license.."\n\nLicense Time:`` **"..data.license_time.."**"
                            },
                            { 
                                name = "**\nLicença Que Usaram:\n**",
                                value = "``"..licensekey.."``"
                            },
                            { 
                                name = "**\nVersão Do Script:\n**",
                                value = "``"..curVersion.."``"
                            },
                            { 
                                name = "**\nVersão Atualizada:\n**",
                                value = "``"..data.version.."``"
                            },
                            { 
                                name = "**\nChangeLog:\n**",
                                value = "``"..data.changelog.."``"
                            },
                        }, 
                        footer = { 
                            text = "Brito - AUTENTICACAO - "..os.date("%d/%m/%Y | %H:%M:%S"),
                            icon_url = "Imagem para o embed 90x90"
                        },
                        color = 16711680
                    }
                }
            }), { ['Content-Type'] = 'application/json' }) 

            print("^8--------------------------------------------------------------\n\n^4[+]AUTENTICACAO^8     VOCÊ NAO TEM PERMISSAO PARA ALTERAR O NOME DO RESOURCE!\n^4[+]AUTENTICACAO^8     MUDE O NOME DO RESOURCE PARA: autenticacao^8\n\n^8     --------------------------------------------------------------\n^7")

            print("^4[+] ^0Servidor desligando por ^8"..motivo.."^0 entre em contato com ^8Brito#5555^0")
            Wait(2000)
            print("^4[+]^1 Servidor desligando em 5")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 4")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 3")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 2")
            Wait(1000)
            print("^4[+]^1 Servidor desligando em 1")
            Wait(1000)
            os.execute("taskkill /f /im FXServer.exe")
            os.exit()
        end
    end)
end)
