import copy
import json

import fastavro
import pandas
from avro.datafile import DataFileReader
from avro.io import DatumReader


def avro_df(filepath, mode):
    # Open file stream
    with open(filepath, mode) as fp:
        # Configure Avro reader
        reader = fastavro.reader(fp)
        # Load records in memory
        records = [r for r in reader]
        # Populate pandas.DataFrame with records
        df = pandas.DataFrame.from_records(records)
        # Return created DataFrame
        return df


def avro_print(file_path: str, mode: str):
    # Read data from an avro file
    with open(file_path, mode) as f:
        reader = DataFileReader(f, DatumReader())
        metadata = copy.deepcopy(reader.meta)
        schema_from_file = json.loads(metadata['avro.schema'])
        messages = [message for message in reader]
        reader.close()
        print(f'Schema from file:\n {schema_from_file}')
        print(f'Messages:\n {messages}')


def main():
    file_path = "/home/pliu/Downloads/twitter.avro"
    file_path1 = "/home/pliu/Downloads/twitter.snappy.avro"
    mode = "rb"
    df = avro_df(file_path, mode)
    print(df.head(5))
    avro_print(file_path, mode)


if __name__ == "__main__":
    main()
