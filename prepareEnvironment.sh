if ! command -v conda &> /dev/null
then
echo "anaconda cannot be found, please followinstructions at \nhttps://docs.anaconda.com/anaconda/install/mac-os/"
end
fi
c=$(echo $(conda info -e))
if echo $c | grep arduino; then
    echo conda exists. Continuing
else
    echo setting conda arduino environment
    pyVersion=$(echo $(python -V | cut -f2 -d ' '))
    s=$(echo $(echo "$SHELL" | cut -f3 -d '/'))
    conda init $s
    conda create --name arduino python=$pyVersion
fi
p=$(echo $(conda list))
if echo p | grep pyserial; then
    echo got pyserial, setting environment
else
    echo installing pyserial
    conda install pyserial
fi
conda activate arduino