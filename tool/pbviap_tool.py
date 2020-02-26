#!/usr/bin/python

import sys
import PbVIAP


if sys.argv[1:] == ['-version']:
	print(viap_svcomp.getVersion())
elif sys.argv[1:] == ['--version']:
	print(viap_svcomp.getVersion())
elif sys.argv[1:] != [] and sys.argv[-1] is not None:
	filename=sys.argv[-1]	
	if len(sys.argv[1:])==1: 
		PbVIAP.prove_auto(filename)
	elif len(sys.argv[1:])==2: 
		propertyfile=sys.argv[-2]
		if '.prp' in propertyfile:
			PbVIAP.prove_auto(filename,propertyfile)
		else:
			PbVIAP.prove_auto(filename)	
	else:
		viap_svcomp.prove_auto(filename)

