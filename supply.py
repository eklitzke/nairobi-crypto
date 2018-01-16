import argparse
import datetime


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-o', '--output', default='supply.dat')
    args = parser.parse_args()

    outfile = open(args.output, 'w')

    start_time = datetime.datetime(2009, 1, 3)
    end_time = datetime.datetime(2050, 1, 1)

    last_time = start_time
    d = start_time

    blocks = 0
    coins = 0
    while d < end_time:
        new_blocks = (d - last_time).total_seconds() / 600.
        blocks += new_blocks
        issuance = 50 / 2**(blocks // 210000)
        coins += issuance * new_blocks
        outfile.write('{} {}\n'.format(d.strftime('%Y-%m-%d'), coins))
        last_time = d
        d += datetime.timedelta(seconds=3600)


if __name__ == '__main__':
    main()
