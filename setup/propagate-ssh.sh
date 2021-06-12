# TODO
for host in $(grep "^Host" ~/.ssh/config | cut -d' ' -f2); do
  echo managing $host
done
