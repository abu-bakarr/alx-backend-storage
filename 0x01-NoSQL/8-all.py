#!/usr/bin/env python3
"""
List all documents
"""
import pymongo


def list_all(mongo_collection):
    """
    List all documents in Python.
    """
    return list(mongo_collection.find())
