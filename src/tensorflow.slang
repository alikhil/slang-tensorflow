
// IntPtr ~ ref Int
// VoidRef ~ void*

// We use this TF_Xxx as the native "TF_Xxx *" as those are opaque
use IntPtr as TF_Status 
use IntPtr as TF_SessionOptions 
use IntPtr as TF_Graph 
use IntPtr as TF_OperationDescription 
use IntPtr as TF_Operation 
use IntPtr as TF_Session 
use IntPtr as TF_DeprecatedSession 
use IntPtr as TF_Tensor 
use IntPtr as TF_ImportGraphDefOptions 
use IntPtr as TF_Library 
use IntPtr as TF_BufferPtr 
use IntPtr as TF_Function 

unit TFDataType
    const is 0..23 end
		/// The TFDataType has not been set
    Unknown is 0

    /// Single precission floatint point, 32-bits (C# float)
    Float is 1
    /// Double precission floatint point, 64-bits (C# double)
    Double is 2
    /// 32-bit signed integers (C# int)
    Int32 is 3
    /// 8 bit unsigned integers (C# byte)
    UInt8 is 4
    /// 16-bit signed integers (C# short)
    Int16 is 5
    /// 8-bit signed integers (C# sbyte)
    Int8 is 6
    /// Binary blob
    String is 7
    /// Single precission complex numbers (32-bit floats)
    Complex64 is 8
    /// 32-bit float based complex numbers
    Complex is 8
    /// 64-bit signed integers (C# long)
    Int64 is 9
    /// 8-bit boolean (C# bool)
    Bool is 10
    /// Quantized 8-bit signed integer
    QInt8 is 11
    /// Quantized 8-bit unsigned integer
    QUInt8 is 12
    /// Quantized 32-bit signed integer
    QInt32 is 13
    /// Float32 truncated to 16 bits.  Only for cast operations.
    BFloat16 is 14
    /// Quantized 16-bit signed integer
    QInt16 is 15
    /// Quantized 16-bit unsigned integer
    QUInt16 is 16
    /// 16-bit unsigned integers (C# long)
    UInt16 is 17
    /// Double precission complex numbers (32-bit floats)
    Complex128 is 18

    /// Half floats - 16-bit half precision floating point.
    Half is 19

    /// Handle to a mutable resource.
    Resource is 20

    /// Variant data type
    Variant is 21

    /// 32-bit unsigned integers
    UInt32 is 22

    /// 64-bit unsigned integers
    UInt64 is 23
end


unit TF_Code
    
    const is 0..15 end

    /// Not an error; returned on success
    Ok is 0    
    /// The operation was cancelled (typically by the caller).
    Cancelled is 1    
    /// Unknown error.  An example of where this error may be returned is
    /// if a Status value received from another address space belongs to
    /// an error-space that is not known in this address space.  Also
    /// errors raised by APIs that do not return enough error information
    /// may be converted to this error.
    Unknown is 2
    /// Client specified an invalid argument.  Note that this differs
    /// from FailedPrecondition.  InvalidArgumentindicates arguments
    /// that are problematic regardless of the state of the system
    /// (e.g., a malformed file name).
    InvalidArgument is 3
    /// Deadline expired before operation could complete.  For operations
    /// that change the state of the system, this error may be returned
    /// even if the operation has completed successfully.  For example, a
    /// successful response from a server could have been delayed long
    /// enough for the deadline to expire.
    DeadlineExceeded is 4
    /// Some requested entity (e.g., file or directory) was not found.
    /// For privacy reasons, this code may be returned when the client
    /// does not have the access right to the entity.
    NotFound is 5
    /// Some entity that we attempted to create (e.g., file or directory) already exists.
    AlreadyExists is 6
    /// The caller does not have permission to execute the specified
    /// operation.  PermissionDenied must not be used for rejections
    /// caused by exhausting some resource (use ResourceExhausted
    /// instead for those errors).  PermissionDeniedmust not be
    /// used if the caller can not be identified (use Unauthenticated
    /// instead for those errors).
    PermissionDenied is 7
    /// The request does not have valid authentication credentials for the
    /// operation.
    Unauthenticated is 16

    /// Some resource has been exhausted, perhaps a per-user quota, or
    /// perhaps the entire file system is out of space.
    ResourceExhausted is 8
    /// Operation was rejected because the system is not in a state
    /// required for the operation's execution.  For example, directory
    /// to be deleted may be non-empty, an rmdir operation is applied to
    /// a non-directory, etc.
    ///
    /// A litmus test that may help a service implementor in deciding
    /// between FailedPrecondition, Aborted, and Unavailable:
    /// 
    ///  (a) Use Unavailableif the client can retry just the failing call.
    ///  (b) Use Aborted if the client should retry at a higher-level
    ///      (e.g., restarting a read-modify-write sequence).
    ///  (c) Use FailedPrecondition if the client should not retry until
    ///      the system state has been explicitly fixed.  E.g., if an "rmdir"
    ///      fails because the directory is non-empty, FailedPrecondition
    ///      should be returned since the client should not retry unless
    ///      they have first fixed up the directory by deleting files from it.
    ///  (d) Use FailedPrecondition if the client performs conditional
    ///      REST Get/Update/Delete on a resource and the resource on the
    ///      server does not match the condition. E.g., conflicting
    ///      read-modify-write on the same resource.
    FailedPrecondition is 9
    /// The operation was aborted, typically due to a concurrency issue
    /// like sequencer check failures, transaction aborts, etc.
    ///
    /// See litmus test above for deciding between FailedPrecondition,
    /// Aborted and Unavailable
    Aborted is 10

    /// Operation tried to iterate past the valid input range.  E.g., seeking or
    /// reading past end of file.
    ///
    /// Unlike InvalidArgument, this error indicates a problem that may
    /// be fixed if the system state changes. For example, a 32-bit file
    /// system will generate InvalidArgument if asked to read at an
    /// offset that is not in the range [0,2^32-1], but it will generate
    /// OutOfRange if asked to read from an offset past the current
    /// file size.
    ///
    /// There is a fair bit of overlap between FailedPrecondition and
    /// OutOfRange.  We recommend using OutOfRane (the more specific
    /// error) when it applies so that callers who are iterating through
    /// a space can easily look for an OutOfRange error to detect when
    /// they are done.
    OutOfRange is 11

    /// Operation is not implemented or not supported/enabled in this service.
    Unimplemented is 12

    /// Internal errors.  Means some invariants expected by underlying
    /// system has been broken.  If you see one of these errors,
    /// something is very broken.
    Internal is 13

    /// The service is currently unavailable.  This is a most likely a
    /// transient condition and may be corrected by retrying with
    /// a backoff.
    ///
    /// See litmus test above for deciding between FailedPrecondition,
    /// Aborted, and Unavailable.
    Unavailable is 14

    /// Unrecoverable data loss or corruption.
    DataLoss is 15
end


/// Low-level: Enumeration describing the types of a metadata attribute
unit TFAttributeType

    const is 0..8 end

    /// The type of the attribute is a string
    String is 0

    /// The type of the attribute is an int.
    Int is 1

    /// The type of the attribute is a float
    Float is 2

    /// The type of the attribute is a bool.
    Bool is 3

    /// The type of the attribute is a type.
    Type is 4

    /// The type of the attribute is a tensor shape
    Shape is 5

    /// The type of the attribute is a tensor
    Tensor is 6

    /// The type of the attribute is a placeholder
    Placeholder is 7

    /// The type of the attribute is a function
    Func is 8

end


unit TFDisposable

    handle: IntPtr

        // TODO: do something with this
		// static TFDisposable ()
		// {
		// 	TFCore.CheckSize ();
		// }

        init(h: IntPtr) is
            handle := h
        end
		// TODO: do we have object disposing module via GC ? if we do then implement in smart way as in C# otherwise keep as it is
        

        NativeDispose(handle: IntPtr) is abstract

        dispose() is 
            NativeDispose(handle)
            handle = IntPtr.Zero
        end
        
end

// this unit will be used by TF_Status
unit TF_Status_Static // TFDisposable

    TF_NewStatus(): TF_Status is external

    TF_DeleteStatus(s: TF_Status) is external

    TF_SetStatus(s: TF_Status, code: TF_Code, msg: String) is external

    TF_GetCode(s: TF_Status): TF_Code is external

    // Return a pointer to the (null-terminated) error message in *s.  The
    // return value points to memory that is only usable until the next
    // mutation to *s.  Always returns an empty string if TF_GetCode(s) is
    // TF_OK.
    // TODO: how to convert pointer to null-terminated message
    // Done, we will assume that there is IntPtr unit which has GetString method
    TF_Message(s: TF_Status): ref IntPtr is external

    Setup(incoming: TF_Status) is 
        return if incoming = IntPtr.Zero then TFStatus() else incoming
    end

end

unit TF_Status extend TFDisposable
    use TF_Status_Static

    init() is
        super(TF_NewStatus())
    end

    SetStatusCode(code: TF_Code, msg: String) is
        TF_SetStatus(handle, code, msg)
    end

    StatusMessage(): String => Marshal.getString(TF_Message(handle))

    override DisposeNative(handle: TF_Status) is
        TF_DeleteStatus(handle)
    end

    StatusCode: TF_Code is
        if handle = IntPtr.Zero then
            raise "Object disposed!"
        end
        return TF_GetCode(handle)
    end

    IsOk: Boolean is
        return StatusCode = TF_Code.Ok
    end

    IsError: Boolean is
        return StatusCode /= TF_Code.Ok
    end

    CheckMaybeRaise(status: ?TFStatus, last: Boolean = true) is 
        if (not status is TFStatus) then
				if (handle = IntPtr.Zero) then
					StdOut.WriteLine ("oops")
                end
				if (StatusCode /= TFCode.Ok) then
					var e = TFException (StatusMessage)
					if (last) then
						Dispose ()
                    end
					raise e
				end
				if (last) then
					Dispose ();
                end
				return true;
		end
        return StatusCode = TFCode.Ok;
    end

    hidden raiseError() is
        raise StatusMessage()
    end



    
end

unit TFString
        // TODO: convert to SLANG
		// extern size_t TF_StringEncode (const char *src, size_t src_len, char *dst, size_t dst_len, TF_Status *status);
		internal static extern unsafe size_t TF_StringEncode (byte* src, size_t src_len, sbyte* dst, size_t dst_len, TF_Status status);
		TF_StringEncode(src: ref Byte, src_len: UIntPtr, sbyte:) : UIntPtr 

		// extern size_t TF_StringDecode (const char *src, size_t src_len, const char **dst, size_t *dst_len, TF_Status *status);
		[DllImport (NativeBinding.TensorFlowLibrary)]
		internal static extern unsafe size_t TF_StringDecode (sbyte* src, size_t src_len, sbyte** dst, size_t* dst_len, TF_Status status);

		// extern size_t TF_StringEncodedSize (size_t len);
		[DllImport (NativeBinding.TensorFlowLibrary)]
		internal static extern size_t TF_StringEncodedSize (size_t len);

end


unit TFSessionOptions_Static

    TF_NewSessionOptions(): TF_SessionOptions is external

    TF_DeleteSessionOptions(options: TF_SessionOptions) is external

    TF_SetTarget(options: TF_SessionOptions, target: String) is external

    TF_SetConfig(options: TF_SessionOptions, proto: IntPtr, proto_len: UIntPtr, status: TF_Status) is external
end

unit TFSessionOptions extend TFDisposable
	use TFSessionOptions_Static

    init() is
        super(TF_NewSessionOptions())
    end

    override NativeDispose(options: TF_SessionOptions) is
        TF_DeleteSessionOptions(options)
    end


    SetTarget(target: String) is
        if (handle = IntPtr.Zero) then
            raise "Object disposed!"
        end
        TF_SetTarget(target)
    end

    SetConfig(protoData: IntPtr, length: Int, status: TF_Status) is
        if (handle = IntPtr.Zero) then
            raise "Object disposed!"
        end

        cstatus = TF_Status_Static.Setup(status)

        TF_SetConfig(handle, protoData, len, cstatus.handle)
        cstatus.CheckMaybeRaise(status)
    end

end


unit TFInput_Static

    routine TF_OperationInput(oper_in: TFInput): TFOutput is external

    routine TF_OperationInputType(oper_in: TFInput): TFDataType is external
end

// WARN:
// 	[StructLayout (LayoutKind.Sequential)]
val unit TFInput
    use TFInput_Static

    Operation: TF_Operation
    Index: Integer

    routine InputType: TFDataType => TF_OperationInputType(this)
    routine GetOutput(inp: TFInput) => TF_OperationInput(inp)
end


unit A
	dom(b: as this) is 

	end
end

unit TFOutput_Static

    routine TF_OperationOutputNumConsumers(oper_out: TFOutput): Integer is external

    routine TF_OperationOutputType(oper_out: TFOutput): TFDataType is external

    routine TF_OperationOutputConsumers(oper_out: TFOutput, consumers: ref TFInput, max_consumers: Integer): Integer is external

end


// WARN:
// [StructLayout (LayoutKind.Sequential)]
val unit TFOutput
	use TFOutput
	LLOperation: TF_Operation
    Index: Integer


    routine NumConsumers: Integer => TF_OperationOutputNumConsumers (this)

		
    routine OutputType: TFDataType => if LLOperation = IntPtr.Zero then TFDataType.Unknown else TF_OperationOutputType (this)


    init(operation: TFOperation, index: Integer) is
        LLOperation := operation.handle
        Index := index

    end

    init(output: TFOutput, index: Integer) is
        LLOperation := output.LLOperation
        Index := index
    end


    routine OutputConsumers: Array[TFInput] is

        // I am not sure, if we can create array with dynamic size
        result is Array[TFInput, NumConsumers].init()
        // TODO: ensure DEREF
        first := DEREF(results(0))
        TF_OperationOutputConsumers(this, first, result.count)
        return result

    end


    // TODO: fix null
    // public TFOperation Operation => new TFOperation (null, LLOperation);
    Operation: TFOperation => TFOperation(null, LLOperation)


    // TODO: does slang has toStr() ?
    public override string ToString ()
    {
        return string.Format ("[{3} Index={1} Operation={2} (0x{0:X})]", (long) LLOperation, Index, Operation, OutputType);
    }

end

	/// <summary>
	/// Low-level TensorFlow operation builder
	/// </summary>
	/// <remarks>
	/// <para>This is the low-level API that is used to create operations by manually specificying all
	/// the parameters of an operation (inputs, outputs, attribute descriptions) that can then
	/// be attached into a graph.
	/// </para>
	/// <para>
	/// Generally, you will instead be using the methods surfaced in <see cref="T:TensorFlow.TFGraph"/> 
	/// that surfaces a C# high-level API that has already been bound to the built-in TensorFlow
	/// nodes.
	/// </para>
	/// <para>
	/// You create instances bound to a graph, add inputs, attributes and so on, and when you are done
	/// you can call the <see cref="FinishOperation"/> method that will turn this TFOperationDesc 
	/// into a <see cref="T:TensorFlow.TFOperation"/>.
	/// </para>
	/// </remarks>



unit TFOperationDesc_Static

	routine TF_NewOperation(graph: TF_Graph, opType: String, oper_name: String): TF_OperationDescription is external

	routine TF_SetDevice(desc: TF_OperationDescription, device: String) is external

	routine TF_AddInput(desc: TF_OperationDescription, output: TFOutput) is external

	routine TF_AddInputList(desc: TF_OperationDescription, inputs: Array[TFOutput], num_inputs: Integer) is external		
	
	routine TF_AddControlInput(desc: TF_OperationDescription, input: TF_Operation) is external

	routine TF_ColocateWith(desc: TF_OperationDescription, op: TF_Operation) is external

	routine TF_SetAttrString(desc: TF_OperationDescription, attr_name: String, value: IntPtr, length: UIntPtr) is external
	
	routine TF_SetAttrStringList(desc: TF_OperationDescription, attr_name: String, values: Array[IntPtr], lenghts: Array[UIntPtr], num_values: Integer) is external
	
	routine TF_SetAttrInt(desc: TF_OperationDescription, attr_name: String, value: Int64) is external

	routine TF_SetAttrIntList(desc: TF_OperationDescription, attr_name: String, values: Array[Int64], num_values: Int) is external
	
	routine TF_SetAttrFloat(desc: TF_OperationDescription, attr_name: String, value: Float) is external
	
	routine TF_SetAttrFloatList(desc: TF_OperationDescription, attr_name: String, values: Array[Float], num_values: Int) is external
	
	routine TF_SetAttrBool(desc: TF_OperationDescription, attr_name: String, value: Byte) is external

	routine TF_SetAttrBoolList(desc: TF_OperationDescription, attr_name: String, values: Array[Boolean], num_values: Int) is external
	
	routine TF_SetAttrType(desc: TF_OperationDescription, attr_name: String, value: TFDataType) is external
	
	routine TF_SetAttrTypeList(desc: TF_OperationDescription, attr_name: String, values: Array[TFDataType], num_values: Int) is external

	routine TF_SetAttrShape(desc: TF_OperationDescription, attr_name: String, dims: Array[Int64], num_dims: Int) is external

	routine TF_SetAttrShape(desc: TF_OperationDescription, attr_name: String, dims: IntPtr, num_dims: Int) is external

	routine TF_SetAttrShapeList(desc: TF_OperationDescription, attr_name: String, dims: IntPtr, num_dims: Array[Int], num_shapes: Int) is external
	
	routine TF_SetAttrTensorShapeProto(desc: TF_OperationDescription, attr_name: String, proto: IntPtr, proto_len: UIntPtr, status: TF_Status) is external
	
	// TODO: was marked with todo in TensorFlowSharp
	routine TF_SetAttrTensorShapeProtoList(desc: TF_OperationDescription, attr_name: String, protos: ref ref Void, proto_lens: UIntPtr, num_shapes: Int, status: TF_Status) is external
	
	routine TF_SetAttrTensor(desc: TF_OperationDescription, attr_name: String, value: TF_Tensor, status: TF_Status) is external
	
	routine TF_SetAttrTensorList(desc: TF_OperationDescription, attr_name: String, values: Array[IntPtr], num_values: Int, status: TF_Status) is external
	
	routine TF_Operation(desc: TF_OperationDescription, status: TF_Status): TF_FinishOperation is external

end

unit TFOperationDesc extend TFDisposable
	use TFOperationDesc_Static

	hidden opType: String
	hidden operName: String
	hidden graph: TFGraph


	init(graph: TFGraph, opType: String, operName: String) is
		super(IntPtr.Zero)

		handle := TF_NewOperation(graph.handle, opType, operName)
		this.graph := graph
		this.opType := opType
		this.operName := operName
	end

	override routine NativeDispose(handle: IntPtr) is
		// If you reach this, you never called FinishOperation
		StdOut.WriteLine($"TFOperationDescription({opType},{operName} was never turned into an TFOperation");

	end


	routine SetDevice(device: String): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end
		TF_SetDevice(handle, device)
		return this
	end


	routine AddInput(input: TFOutput): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end
		TF_AddInput(handle, input)
		return this
	end


	routine AddInputs(inputs: Array[TFOutput]): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end

		if inputs.count = 0 then
			return this
		end

		TF_AddInputList(handle, inputs, inputs.count)
		return this
	end


	routine AddControlInput(control: TFOperation): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end

		TF_AddControlInput(handle, control.handle)
		return this
	end

	routine ColocateWith(op: TFOperation): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end
		TF_ColocateWith(handle, op.handle)
		return this
	end

	routine SetAttr(attrName: String, value: String): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end

		// WARN: assuming that we have such functions
		bytes: Array[Byte] := value.GetBytes()
		buf: Marshal.AllocHGlobal(bytes.count + 1);
		Marshal.Copy(bytes, 0, buf, bytes.count)

		TF_SetAttrString(handle, attrName, buf, bytes.count)
		return this
	end

	routine SetAttr(attrName: String, values: Array[String]): TFOperationDesc is
		if handle = IntPtr.Zero then
			raise "Object disposed!"
		end

		n is values.count
		unmanaged is Array[IntPtr, n].init()
		lenghts is Array[IntPtr, n].init()

		while pos in 0 .. n loop
			bytes := values(pos).GetBytes()
			buf := Marshal.AllocHGlobal(bytes.count + 1)
			bc := bytes.count

			Marshal.Copy(bytes, 0, buf, bc)
			unmanaged(i) := buf
			lenghts(i) := bc as UIntPtr
		end

		TF_SetAttrStringList(handle, attrName, unmanaged, lenghts, n)
		return this

	end



		routine SetAttr(attrName, value: String): TFOperationDesc is
		
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end		
			TF_SetAttrInt (handle, attrName, value)
			return this
		end

		routine SetAttr(attrName: String, values: Array[Int64]): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if values.count = 0 then
				raise "values are empty!"
			end

			TF_SetAttrIntList (handle, attrName, values, values.Length)
			return this
		end

		routine SetAttr (attrName: String, value: Float): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			TF_SetAttrFloat (handle, attrName, value)
			return this
		end

		routine SetAttr (attrName: String, float [] values): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if values.count = 0 then
				raise "values are empty!"
			end

			TF_SetAttrFloatList (handle, attrName, values, values.Length)
			return this
		end

		routine SetAttr (attrName: String, value: Boolean): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			TF_SetAttrBool (handle, attrName, (if value then 1 else 0));
			return this
		end


		routine SetAttr (attrName: String, values: Array[Boolean]): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if values.count = 0 then
				raise "values are empty!"
			end

			TF_SetAttrBoolList (handle, attrName, values, values.Length)
			return this
		end


		routine SetAttrType (attrName: String, dataType: TFDataType): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			TF_SetAttrType (handle, attrName, dataType)
			return this
		end


		routine SetAttrType (attrName: String, dataType: Array[TFDataType]): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if dataType.count = 0 then
				raise "dataType array is empty!"
			end
			TF_SetAttrTypeList (handle, attrName, dataType, dataType.Length)
			return this
		end

		routine SetAttrShape (attrName: String, shape: TFShape): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if shape.dims.count = 0 then
				TF_SetAttrShape (handle, attrName, IntPtr.Zero, -1)
			else
				TF_SetAttrShape (handle, attrName, shape.dims, shape.dims.Length)
			end
			return this
		end


		routine SetAttrShape (attrName: String, shapeList: Array[TFShape]): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			if shapeList.count = 0 then
				raise "shapeList is empty!"
			end
			num_shapes is shapeList.count
			num_dims is Array[Int, shapeList.count].init()

			// TODO: assume sizeof()
			unmanaged = Marshal.AllocHGlobal(sizeof (IntPtr) * num_shapes)

			ofs := 0
			while i in 0 .. num_shapes loop

				// TODO: assume Marshall.*
				array := Marshal.AllocHGlobal (sizeof (Int64) * shapeList(i).dims.count)
				Marshal.Copy (shapeList(i).dims, 0, array, shapeList(i).dims.count)
				Marshal.WriteIntPtr(unmanaged, ofs, array)
				ofs += sizeof (IntPtr)
			end
			TF_SetAttrShapeList (handle, attrName, unmanaged, num_dims, num_shapes)
			ofs := 0
			while i in 0 .. num_shapes loop
				ptr := Marshal.ReadIntPtr (unmanaged, ofs)
				Marshal.FreeHGlobal (ptr)
				ofs += sizeof (IntPtr)
			end
			Marshal.FreeHGlobal (unmanaged)
			return this
		end

		routine SetAttrTensorShapeProto (attrName: String, proto: IntPtr, protoLen: UIntPtr, status: TFStatus): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)
			TF_SetAttrTensorShapeProto (handle, attrName, proto, protoLen, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return this
		end


		routine SetAttr (attrName: String, tensor: TFTensor, status: TFStatus): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)

			TF_SetAttrTensor (handle, attrName, tensor.handle, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return this
		end

		routine SetAttr (attrName: String, tensor: Array[TFTensor], status: TFStatus): TFOperationDesc is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)
			unmanaged is Array[IntPtr, tensor.Length]

			while i in 0..tensor.count loop
				unmanaged(i) := tensor (i).handle
			end
			TF_SetAttrTensorList (handle, attrName, unmanaged, unmanaged.Length, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return this
		end

		// extern void TF_SetAttrValueProto (TF_OperationDescription *desc, const char *attr_name, const void *proto, size_t proto_len, TF_Status *status);
		// [DllImport (NativeBinding.TensorFlowLibrary)]
		// routine TF_SetAttrValueProto(desc: TF_OperationDescription, attr_name: String, VoidRef proto, size_t proto_len, TF_Status status);
		// TODO:


		routine TFOperation FinishOperation (status: TFStatus) is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus: = TFStatus.Setup (status)
			h := TF_FinishOperation (handle, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			handle := IntPtr.Zero
			// GC.SuppressFinalize (this)

			// TODO: decide what to do with this
			// if (status != null && status.Error)
			// 	return null;

			return TFOperation.init(graph, h)
		end
	}

end

unit TFShape
    const is 
        Unknown
    end 

	Scalar is init({})

    dims: Array[Int64]

    init(d: Array[Int64]) is
        dims := d
    end

	// Assume: array.GetLength 
	routine GetLength(dimension: Integer) => dims.GetLength (dimension)

	routine NumDimensions() => dims.count

	routine IsFullySpecified(): Boolean is
		loop i in 0..dims.count do
			if i == -1 then
				return false
			end
		end
		return true
	end

	routine ToArray(): Array[Int64] is
		// Assume: Array.clone()
		cloned := this.dims.clone()
		return cloned
	end


	routine ToInt32Array(): Array[Int32] is
		newArr = Array[Int32, dims.count].init()

		loop i in 0..dims.count do
			// Assume: casting with (Int32)
			newArr(i) := (Int32)dims(i)
		end

		return newArr
	end

	routine IsLongArray(): Boolean is
		loop i in dims.count do
			if dims(i) > Int32.MaxValue then
				return true
			end
		end
		return false
	end

	override routine toString(): String is
		// Assume: String.Join
		// Assume: Array.Select - I think there will be some basic functions like map, find, etc
		return "[" + String.Join (", ", dims.Select (x => if x = -1 then "?" else x.toString ())) + "]"
	end


	routine ()(idx: Int) is
		return dims(idx)
	end

	routine AsTensor(): TFTensor is
		return TFTensor.init(ToInt32Array())
	end

	routine +(left, right: TFShape): TFShape is
		full := Array[Int64, left.dims.count + right.dims.count]

		// Assume: Array.Copy
		Array.Copy (left.dims, full, left.dims.count);
		Array.Copy (right.dims, 0, full, left.dims.count, right.dims.count);
		return TFShape.init(full);

	end

	// TODO: 
	// public static implicit operator TFTensor (TFShape shape)
	// {
	// 	return shape.AsTensor ();
	// }
	}

end

unit TFOperation_Static
		
	routine TF_OperationName(oper: TF_Operation): IntPtr is external

	routine TF_OperationOpType(oper: TF_Operation): IntPtr is external

	routine TF_OperationDevice(oper: TF_Operation): IntPtr is external

	routine TF_OperationNumOutputs(oper: TF_Operation): Integer is external

	routine TF_OperationOutputListLength(oper: TF_Operation, arg_name String, status: TF_Status): Integer is external

	routine TF_OperationNumInputs(oper: TF_Operation): Integer is external

	routine TF_OperationInputListLength(oper: TF_Operation, arg_name String, status: TF_Status): Integer is external

	routine TF_OperationNumControlInputs(oper: TF_Operation): Integer is external

	routine TF_OperationGetControlInputs(oper: TF_Operation, control_inputs: TF_Operation, max_control_inputs: Integer): Integer is external

	routine TF_OperationNumControlOutputs(oper: TF_Operation): Integer is external

	// WARN: [Out] [MarshalAs (UnmanagedType.LPArray, SizeParamIndex = 2)] 
	// How to do it?
	routine TF_OperationGetControlOutputs(oper: TF_Operation, /*[Out] [MarshalAs (UnmanagedType.LPArray, SizeParamIndex = 2)]*/ control_outputs Array[IntPtr], max_control_outputs: Integer): Integer is external

	routine TF_OperationGetAttrMetadata(oper: TF_Operation, attr_name: String, status: TF_Status): TFAttributeMetadata is external
// marked with TODO:
	routine TF_OperationGetAttrString(oper: TF_Operation, attr_name: String, value: VoidRef, max_length: UIntPtr, status: TF_Status) is external

	routine TF_OperationGetAttrStringList(oper: TF_Operation, attr_name: String, values: ref VoidRef, ref UIntPtr lengths, max_values: Integer, storage: storage_size: VoidRefInteger: UIntPtr, status: TF_Status): void is external

	routine TF_OperationGetAttrInt(oper: TF_Operation, attr_name: String, value: ref Int64, status: TF_Status) is external

	routine TF_OperationGetAttrIntList(oper: TF_Operation, attr_name: String, values: ref Int64, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrFloat(oper: TF_Operation, attr_name: String, value: ref Float, status: TF_Status) is external

	routine TF_OperationGetAttrFloatList(oper: TF_Operation, attr_name: String, values: ref Float, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrBool(oper: TF_Operation, attr_name: String, value: ref Byte, status: TF_Status) is external

	routine TF_OperationGetAttrBoolList(oper: TF_Operation, attr_name: String, values: ref Byte, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrType(oper: TF_Operation, attr_name: String, value: ref TFDataType, status: TF_Status) is external

	routine TF_OperationGetAttrTypeList(oper: TF_Operation, attr_name: String, values: ref TFDataType, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrShape(oper: TF_Operation, attr_name: String, value: ref Int64, num_dims: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrShapeList(oper: TF_Operation, attr_name: String, long** dims, num_dims: ref Integer, num_shapes: Integer, storage: ref Int64, storage_size: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrTensorShapeProto(oper: TF_Operation, attr_name: String, value: ref LLBuffer, status: TF_Status) is external

	// WARN: ref ref; is it ok?
	routine TF_OperationGetAttrTensorShapeProtoList(oper: TF_Operation, attr_name: String, values: ref ref LLBuffer, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrTensor(oper: TF_Operation, attr_name: String, value: ref TF_Tensor, status: TF_Status) is external

	routine TF_OperationGetAttrTensorList(oper: TF_Operation, attr_name: String, values: ref TF_Tensor, max_values: Integer, status: TF_Status) is external

	routine TF_OperationGetAttrValueProto(oper: TF_Operation, attr_name: String, output_attr_value: ref LLBuffer, status: TF_Status) is external
// up to here ^
	routine TF_OperationToNodeDef(oper: TF_Operation, output_node_def: ref LLBuffer, status: TF_Status) is external

end

unit TFOperation is

	use TFOperation_Static

	Handle: IntPtr
	graph: TFGraph

	init(graph: TFGraph, handle: IntPtr) is
		this.Handle := handle
		this.graph := graph
	end



		// Assume: IntPtr.GetStr()
		routine Name() => if handle = IntPtr.Zero then "<ObjectDisposed>" else TF_OperationName(handle).GetStr()

		routine OpType() => if handle = IntPtr.Zero then "<ObjectDisposedException>" else TF_OperationOpType(handle).GetStr()

		// routine string Device => TF_OperationDevice (handle).GetStr ();

		routine NumOutputs() => if handle = IntPtr.Zero then -1 else TF_OperationNumOutputs (handle)


		routine OutputListLength (argName: String, status: TFStatus): Integer is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)
			res := TF_OperationOutputListLength (handle, argName, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return res
		end


		routine NumInputs => TF_OperationNumInputs (handle)

		routine InputListLength (argName: String, status: TFStatus): Integer is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)
			res := TF_OperationInputListLength (handle, argName, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return res
		}

		routine NumControlInputs() => TF_OperationNumControlInputs (handle)


		routine NumControlOutputs() => TF_OperationNumControlOutputs (handle)


		routine ControlOutputs(): Array[TFOperation] is
			n := NumControlOutputs()
			arr := Array[IntPtr,n].init()
			
			TF_OperationGetControlOutputs (handle, arr, n)
			ret := Array[TFOperation, n].init()
			loop i in 0..n do
				ret(i) := TFOperation.init(graph, arr(i))
			end
			return ret
		end


		routine GetAttributeMetadata(attrName: String, status: TFStatus): TFAttributeMetadata is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup(status)
			x := TF_OperationGetAttrMetadata (handle, attrName, cstatus.handle)
			cstatus.CheckMaybeRaise (status)
			return x
		end

		routine ToNodeDef(status: TFStatus): TFBuffer is
			if handle = IntPtr.Zero then
				raise "Object disposed!"
			end
			cstatus := TFStatus.Setup (status)
			r := TFBuffer.init()
			TF_OperationToNodeDef (handle, r.LLBuffer, cstatus.handle)

			// No need to raise, we can return null in that case.
			// WARN: I don't know how resolve
			if not cstatus.Ok then
				r.Dispose ()
				raise "some shit happened"
				// return null 
			end
			return r
		end

		routine () (idx: Integer): TFOutput is
			return TFOutput.init(this, idx)
		end
	}
