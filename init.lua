local INSTALLED=0


local reg={
	halts={
		BNTF=0x1
	},
	packages=0x0,
}

function reg_extr(n)
	return bit.band(reg.packages,n)==n
end

function reg_add(n)
	if(reg_extr(n))then
		return reg.halts.BNTF;
	end
	reg.packages=bit.bor(reg.packages,n);
end

function sf(...)
	return string.format(...)
end

function gpname(paths)

	return paths[#paths]
end

function reg_rdmwhm(rhalt,stacktrace)
	assert(rhalt~=reg.halts.BNTF,sf("BNTF %s, invalid.",stacktrace))
end

function setup(packages)
	if(INSTALLE==0)then return end
	for id,path in ipairs(require("dependencies")) do
		if(reg_extr(id)==false)then
			return false;
		end

		local mn=packages[id]
		require(mn.."_config")(require(mn))
	end
	return true;
end


function strspath(s)
	local paths={}
	s=s.."/"
	for subs,k in s:gmatch("[%a.]*")do	
		if(subs:len()>0)then
			paths[#paths+1]=subs
		end
		s=s:sub(subs:len()+1,s:len())
	end
	return paths
end


function install()
	local vfn=vim.fn
	local packpath=vfn.stdpath("data").."/site/pack/packer/start"

	local ali={}	
	local seen={}
	
	for id,path in pairs(require("dependencies")) do
		local pn=gpname(strspath(path))
		local installpath=string.format("%s/%s", packpath,pn)
		if(vfn.empty(vfn.glob(installpath))>0) then
			local link=string.format("https://github.com/%s",path)
			vfn.system({"git","clone","--depth","1",link,installpath})	
			print(path, " was installed")
		else
			ali[#ali+1]=path
		end

		vim.cmd(string.format("packadd %s",pn));
		seen[#seen+1]=pn:sub(0,pn:find(".nvim")-1)
		reg_add(id);
	end


	for _,alp in ipairs(ali) do
		print(alp, " is alread installed")
	end

	INSTALLED=1
	return seen
end

if not setup(install()) then
	print("Something went wrong, please restart neovim :(")
else
	print("Everything's ready :)")
end


