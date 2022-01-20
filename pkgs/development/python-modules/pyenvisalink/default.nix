{ lib
, async-timeout
, buildPythonPackage
, colorlog
, fetchPypi
, pyserial
, pythonOlder
}:

buildPythonPackage rec {
  pname = "pyenvisalink";
  version = "4.3";
  disabled = pythonOlder "3.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "151a9bdefa2772cc9d2f913a32792625a4dc80c6c08086783ebc57de355e68a1";
  };

  propagatedBuildInputs = [
    async-timeout
    colorlog
    pyserial
  ];

  # Tests require an Envisalink device
  doCheck = false;
  pythonImportsCheck = [ "pyenvisalink" ];

  meta = with lib; {
    description = "Python interface for Envisalink 2DS/3 Alarm API";
    homepage = "https://github.com/Cinntax/pyenvisalink";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ fab ];
  };
}
