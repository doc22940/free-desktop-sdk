import csv

def add_delim(value):
    """
    :param value:   
    :type value:    str

    :returns:   
    :rtype:     str
    """
    numdelims = int((24 - len(value) - 1) / 8)
    if numdelims < 1:
        numdelims = 1
    delims = '\t' * numdelims
    return value+delims

with open('service-names-port-numbers.csv', 'r') as f:
    READER = csv.reader(f)
    next(READER)
    PORTS = {}
    for row in READER:
        name, port, protocol, description = tuple(row[:4])
        if not name or not port or not protocol:
            continue
        prot = '{}/{}'.format(port, protocol)
        if prot not in PORTS:
            PORTS[prot] = (name, [], description)
        else:
            PORTS[prot][1].append(name)

with open('services', 'w') as out:
    for prot, values in PORTS.items():
        name, aliases, description = values

        description = description.splitlines()
        if description:
            description = '# {}'.format(description[0])
        else:
            description = ''

        aliases = ' '.join(aliases)

        out.write('{}{}{}{}\n'.format(add_delim(name),
                                      add_delim(prot),
                                      add_delim(aliases),
                                      description))

with open('protocols', 'w') as out:
    with open('protocol-numbers-1.csv', 'r') as f:
        READER = csv.reader(f)
        next(READER)
        PORTS = {}
        for row in READER:
            number, keyword, description = tuple(row[:3])
            if not keyword:
                name = '#'
            else:
                name = keyword.lower()

            if keyword.endswith(' (deprecated)'):
                name = '#'

            description = description.splitlines()
            if description:
                description = '# {}'.format(description[0])
            else:
                description = ''

            out.write('{}{}{}{}\n'.format(add_delim(name),
                                          add_delim(number),
                                          add_delim(keyword),
                                          description))
