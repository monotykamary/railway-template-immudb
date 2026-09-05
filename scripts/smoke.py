#!/usr/bin/env python3
import os,requests,base64,uuid
b=os.environ['BASE_URL'].rstrip('/');pw=os.environ['ADMIN_PASSWORD'];enc=lambda x:base64.b64encode(x).decode()
assert requests.get(b+'/api/v2/health',timeout=30).status_code==200
bad=requests.post(b+'/api/v2/login',json={'user':enc(b'immudb'),'password':enc(b'wrong')},timeout=30);assert bad.status_code in (400,401,403,500) and 'invalid user name or password' in bad.text
r=requests.post(b+'/api/v2/login',json={'user':enc(b'immudb'),'password':enc(pw.encode())},timeout=30);assert r.status_code==200,r.text
u=requests.get(b+'/api/v2/db/use/defaultdb',headers={'Authorization':'Bearer '+r.json()['token']},timeout=30);assert u.status_code==200,u.text
t=u.json()['token'];h={'Authorization':'Bearer '+t};k=('railway-'+uuid.uuid4().hex).encode();v=b'immudb persistence probe';w=requests.post(b+'/api/v2/db/set',headers=h,json={'KVs':[{'key':enc(k),'value':enc(v)}]},timeout=30);assert w.status_code==200,w.text
g=requests.get(b+'/api/v2/db/get/'+enc(k),headers=h,timeout=30);assert g.status_code==200 and base64.b64decode(g.json()['value'])==v
print('immudb smoke checks passed',enc(k))
